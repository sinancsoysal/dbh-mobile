part of '../../view/folder_view.dart';

class _BlocRepositoryOfFolderOperations{
  _BlocRepositoryOfFolderOperations({
    required BuildContext context,
    required FmDbhApiResourcesUseCase fmDbhApiResourcesUseCase
  }):_context=context,
        _fmDbhApiResourcesUseCase=fmDbhApiResourcesUseCase;

  final BuildContext _context;
  final FmDbhApiResourcesUseCase _fmDbhApiResourcesUseCase;

  String? path;
  FmDbhApiFolder? lastFetchedFolder;
  FmFolderFetchStatusEnum? _fmFolderFetchStatus;

  final StreamController<FmFolderFetchStatusEnum> _fmFolderFetchStatusStreamController=StreamController<FmFolderFetchStatusEnum>();
  Stream<FmFolderFetchStatusEnum> get fmFolderFetchStatusStream async* {
    yield* _fmFolderFetchStatusStreamController.stream;
  }

  String? get previousPath=>path.previousFolderPath;

  String get _authToken=>PreferencesManager.instance.getStringValue(PreferencesKeys.fmDbhAuthToken);

  void _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum status){
    _fmFolderFetchStatus=status;
    _fmFolderFetchStatusStreamController.add(status);
  }

  Future<void> fetchFolder({
    required String folderPath
  })async{
    path=folderPath;
    try{
      _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum.fetching);

      HttpResponse<FmDbhApiFolder?> result=await _fmDbhApiResourcesUseCase(
          params: FmDbhApiResourcesParams(
              authToken: _authToken,
              cookieToken: "'auth= _authToken'",
              folderPath: folderPath
          )
      );

      if(result.response.statusCode!=null&&result.response.statusCode==200&&result.data!=null){
        lastFetchedFolder=result.data;
        debugPrint("_fmFolderFetchStatusUpdater Success Result: ${lastFetchedFolder?.toJson()}");
        _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum.fetched);
      }else{
        late final String _snackBarErrorMessage;

        switch(result.response.statusCode){
          case 403:
            _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorFolderCouldNotFetchDueAuthTokenError.tr();
            _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum.failedDueAuthTokenError);
            break;
          case 404:
            _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorDeletedOrMissingFolderCouldNotFetch.tr();
            _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum.failedDueHttpResponseCode404);
            break;
          case 401:
            _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorUnauthorizedFolderCouldNotFetch.tr();
            _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum.failedDueHttpResponseCode401);
            break;
          default:
            _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorFolderCouldNotFetchDueUnknownReasons.tr();
            _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum.failedDueUnknownReason);
        }

        CustomSnackBar(_context, _snackBarErrorMessage, isSuccess: false).show;
      }
    }catch(e){
      debugPrint("Error on(bloc_repository_of_folder_operations - fetchFolder): ${e.toString()}");
      CustomSnackBar(_context, LocaleKeys.folderView_snackBar_errorFolderCouldNotFetchDueUnknownReasons.tr(), isSuccess: false).show;
      _fmFolderFetchStatusUpdater(FmFolderFetchStatusEnum.failedDueUnknownReason);
    }
  }



  void dispose(){
    _fmFolderFetchStatusStreamController.close();
  }
}
