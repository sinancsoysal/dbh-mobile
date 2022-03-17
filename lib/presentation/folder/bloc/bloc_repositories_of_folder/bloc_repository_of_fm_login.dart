part of '../../view/folder_view.dart';

class _BlocRepositoryOfFmLogin{
  _BlocRepositoryOfFmLogin({
    required BuildContext context,
    required FmUserUseCaseLogin fmUserUseCaseLogin,
    required UserGetFileManagerLoginDetailsUseCase userGetFileManagerLoginDetailsUseCase
  }):_context=context,
        _fmUserUseCaseLogin=fmUserUseCaseLogin,
        _userGetFileManagerLoginDetailsUseCase=userGetFileManagerLoginDetailsUseCase;

  final BuildContext _context;
  final FmUserUseCaseLogin _fmUserUseCaseLogin;
  final UserGetFileManagerLoginDetailsUseCase _userGetFileManagerLoginDetailsUseCase;

  String get _token=>PreferencesManager.instance.getStringValue(
      PreferencesKeys.token
  );

  FmLoginStatusEnum? _fmLoginStatus;
  FileManagerLoginDto? _fileManagerLoginDto;

  final StreamController<FmLoginStatusEnum> _fmLoginStatusStreamController=StreamController<FmLoginStatusEnum>();
  Stream<FmLoginStatusEnum> get fmLoginStatusStream async* {
    yield* _fmLoginStatusStreamController.stream;
  }

  void _fmLoginStatusUpdater(FmLoginStatusEnum status){
    _fmLoginStatus=status;
    _fmLoginStatusStreamController.add(status);
  }

  Future<void> startFmLogin()async{
    debugPrint("blocRepositoryOfFmLogin: startFmLogin 1");
    await _getUserCredentials();


    debugPrint("blocRepositoryOfFmLogin: startFmLogin 2");
    if(_fmLoginStatus==FmLoginStatusEnum.loginCredentialsFetched){
      debugPrint("blocRepositoryOfFmLogin: startFmLogin 3");
      await _fmUserLogin();
    }
  }


  Future<dynamic> _getUserCredentials()async{
    debugPrint("blocRepositoryOfFmLogin: _getUserCredentials 1");
    _fmLoginStatusUpdater(FmLoginStatusEnum.loginCredentialsRequesting);

    try{
      await _userGetFileManagerLoginDetailsUseCase(
        params: UserParamsGetFileManagerLoginDetails(
            bearerToken: "Bearer "+_token
        ),
        onSuccess: (p0) {
          if(p0!=null&&p0.value!=null&&p0.value!.data!=null){
            _fileManagerLoginDto=FileManagerLoginDto(
                username: p0.value!.data!.username,
                password: p0.value!.data!.password,
                recaptcha: p0.value!.data!.recaptcha
            );
            _fmLoginStatusUpdater(FmLoginStatusEnum.loginCredentialsFetched);
          }else{
            _fmLoginStatusUpdater(FmLoginStatusEnum.loginCredentialsCouldNotFetch);
            CustomSnackBar(_context, LocaleKeys.folderView_snackBar_anErrorOccurredFmCredentialsCouldNot.tr(), isSuccess: false).show;
          }
        },
        onAuthorizationFail: (){
          _fmLoginStatusUpdater(FmLoginStatusEnum.loginCredentialsCouldNotFetch);
          CustomSnackBar(_context, LocaleKeys.customSnackBar_commonErrors_authorizationFail.tr(), isSuccess: false).show;
        },
        onFail: (p0) {
          _fmLoginStatusUpdater(FmLoginStatusEnum.loginCredentialsCouldNotFetch);
          CustomSnackBar(_context, LocaleKeys.folderView_snackBar_anErrorOccurredFmCredentialsCouldNot.tr(), isSuccess: false).show;
        },
      );
    }catch(e){
      debugPrint("Error on _BlocRepositoryOfFmLogin, _getUserCredentials Function: ${e.toString()}");
      _fmLoginStatusUpdater(FmLoginStatusEnum.loginCredentialsCouldNotFetch);
      CustomSnackBar(_context, LocaleKeys.folderView_snackBar_anErrorOccurredFmCredentialsCouldNot.tr(), isSuccess: false).show;
    }
  }
  
  Future<void> _fmUserLogin()async{
    _fmLoginStatusUpdater(FmLoginStatusEnum.fmLoginRequestSending);
    try{
      final HttpResponse result=await _fmUserUseCaseLogin(
          params: FmLoginParams(
              password: _fileManagerLoginDto!.password,
              username: _fileManagerLoginDto!.username,
              recaptcha: _fileManagerLoginDto!.recaptcha??""
          )
      );

      if(result.response.statusCode!=null&&result.response.statusCode==200){
        debugPrint("fmDbhAuthToken successfully fetched.\nAuthKey: ${result.response.data}");

        await PreferencesManager.instance.setStringValue(
            PreferencesKeys.fmDbhAuthToken,
            result.response.data
        );

        _fmLoginStatusUpdater(FmLoginStatusEnum.fmLoginCookieFetched);
      }else{
        debugPrint("Error on(bloc_repository_of_fm_login - _fmUserLogin): authTokenCouldn'tFetch ${result.response.statusCode}");
        late final String _snackBarErrorMessage;

        switch(result.response.statusCode){
          case(403):
            _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorFmCredentialsNotCorrect.tr();
            break;
          case(null):
            _snackBarErrorMessage= LocaleKeys.folderView_snackBar_errorHttpStatusCodeReturnedNullOnFmLogin.tr();
            break;
          default:
            _snackBarErrorMessage= LocaleKeys.folderView_snackBar_errorFmAuthKeyCouldNotFetch.tr();
        }

        CustomSnackBar(_context, _snackBarErrorMessage, isSuccess: false).show;
        _fmLoginStatusUpdater(FmLoginStatusEnum.fmLoginCookieCouldNotFetch);
      }
    }catch(e){
      debugPrint("Error on(bloc_repository_of_fm_login - _fmUserLogin): ${e.toString()}");

      _fmLoginStatusUpdater(FmLoginStatusEnum.fmLoginCookieCouldNotFetch);
    }
  }


  void dispose(){
    _fmLoginStatusStreamController.close();
  }
}
