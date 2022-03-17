part of '../view/folder_view.dart';

class FolderBloc extends Bloc<_FolderEvent, _FolderState>{
  FolderBloc({
    required _BlocRepositoryOfFmLogin blocRepositoryOfFmLogin,
    required _BlocRepositoryOfFolderOperations blocRepositoryOfFolderOperations,
    required _BlocRepositoryOfFileDownloader blocRepositoryOfFileDownloader,
    required this.blocRepositoryOfLocalDatas
  }):_blocRepositoryOfFmLogin=blocRepositoryOfFmLogin,
        _blocRepositoryOfFolderOperations=blocRepositoryOfFolderOperations,
        _blocRepositoryOfFileDownloader=blocRepositoryOfFileDownloader,
  super(const _FolderState(folderList: null)){
    on<_FmLoginStartEvent>(_onFmStartLoginEvent);
    on<_FmLoginStatusUpdateEvent>(_onFmLoginStatusUpdate);


    on<_FmFolderFetchEvent>(_onFmFolderFetchEvent);
    on<_FmFolderFetchStatusUpdateEvent>(_onFmFolderStatusUpdateEvent);
    on<_FmFileDownloaderIndicatorPercentUpdateEvent>(_onFmFileDownloaderIndicatorPercentUpdate);
    on<_FmFileDownloaderStatusUpdateEvent>(_onFmFileDownloaderStatusUpdate);


    _fmLoginStatusStreamSubscription=_blocRepositoryOfFmLogin.fmLoginStatusStream.listen(
            (fmLoginStatus)=>add(
                _FmLoginStatusUpdateEvent(
                    fmLoginStatus: fmLoginStatus
                )
            )
    );

    _fmFolderFetchStatusStreamsSubscription=_blocRepositoryOfFolderOperations.fmFolderFetchStatusStream.listen(
            (fmFolderFetchStatus)=>add(
                _FmFolderFetchStatusUpdateEvent(
                    fmFolderFetchStatus: fmFolderFetchStatus
                )
            )
    );

    _fmFileDownloaderIndicatorPercentStreamSubscription=_blocRepositoryOfFileDownloader.fileDownloaderIndicatorPercentStatusStream.listen(
            (fileDownloaderIndicatorPercent)=>add(
                _FmFileDownloaderIndicatorPercentUpdateEvent(
                    fileDownloadPercent: fileDownloaderIndicatorPercent??0
                )
            )
    );

    _fmFileDownloaderStatusStreamSubscription=_blocRepositoryOfFileDownloader.fileDownloaderStatusStream.listen(
            (fmFileDownloadStatus)=>add(
                _FmFileDownloaderStatusUpdateEvent(
                    fmFileDownloadStatusEnum: fmFileDownloadStatus
                )
            )
    );
  }
  final _BlocRepositoryOfFmLogin _blocRepositoryOfFmLogin;
  final _BlocRepositoryOfLocalDatas blocRepositoryOfLocalDatas;
  final _BlocRepositoryOfFolderOperations _blocRepositoryOfFolderOperations;
  final _BlocRepositoryOfFileDownloader _blocRepositoryOfFileDownloader;

  late StreamSubscription<FmLoginStatusEnum> _fmLoginStatusStreamSubscription;
  late StreamSubscription<FmFolderFetchStatusEnum> _fmFolderFetchStatusStreamsSubscription;

  late StreamSubscription<FmFileDownloadStatusEnum> _fmFileDownloaderStatusStreamSubscription;
  late StreamSubscription<int?> _fmFileDownloaderIndicatorPercentStreamSubscription;


  FutureOr<void> _onFmStartLoginEvent(
      _FmLoginStartEvent event,
      Emitter<_FolderState> emit
  )async{
    await _blocRepositoryOfFmLogin.startFmLogin();
  }

  FutureOr<void> _onFmLoginStatusUpdate(
      _FmLoginStatusUpdateEvent event,
      Emitter<_FolderState> emit
  )async{
    switch(event.fmLoginStatus){
      case FmLoginStatusEnum.fmLoginCookieFetched:
        emit(state.copyWith(fmLoginStatus: event.fmLoginStatus));
        await _blocRepositoryOfFolderOperations.fetchFolder(folderPath: "");
        break;
      case FmLoginStatusEnum.initialState:
      case FmLoginStatusEnum.loginCredentialsRequesting:
      case FmLoginStatusEnum.loginCredentialsFetched:
      case FmLoginStatusEnum.loginCredentialsCouldNotFetch:
      case FmLoginStatusEnum.fmLoginRequestSending:
      case FmLoginStatusEnum.fmLoginCookieCouldNotFetch:
      default:emit(state.copyWith(fmLoginStatus: event.fmLoginStatus));
    }
  }

  ///_getUpdatedAndMergedFolderList function is just merging or updating
  ///our state's folder list with _blocRepositoryOfFolderOperations.folder
  ///if operation needed.
  ///Example; if we fetched 5 folder, we have them at our state like List
  ///if user will go to deeper folder, then we are adding it to our folder list(merge)
  ///but if user just refresh current folder(reload(fetched) an exist folder)
  ///than this function check the folder list with last updated folders path
  ///and will change it with last updated folder (update)
  ///after that we can return the merged and updated new folder list.
  Future<List<FmDbhApiFolder?>?> _getUpdatedAndMergedFolderList()async{
    if(_blocRepositoryOfFolderOperations.lastFetchedFolder!=null){
      final List<FmDbhApiFolder?> _tempFolderList=[...state.folderList];
      final int folderListIndex=_tempFolderList.indexWhere(
              (element){

                if(element!=null){
                  final String _elementPath=element.path.endsWith("/")
                      ?element.path
                      :element.path+"/";
                  final String _lastFetchedFolderPath=_blocRepositoryOfFolderOperations.lastFetchedFolder!.path.endsWith("/")
                      ?_blocRepositoryOfFolderOperations.lastFetchedFolder!.path
                      :_blocRepositoryOfFolderOperations.lastFetchedFolder!.path+"/";
                  if(_elementPath==_lastFetchedFolderPath){
                    return  true;
                  }
                }
                return false;
              }
      );

      ///if(folderExist)
      if(folderListIndex!=-1){
        _tempFolderList[folderListIndex]=_blocRepositoryOfFolderOperations.lastFetchedFolder!;
      }else{
        if(_blocRepositoryOfFolderOperations.lastFetchedFolder!=null){
          _tempFolderList.add(_blocRepositoryOfFolderOperations.lastFetchedFolder);
        }
      }

      return _tempFolderList;
    }else{

      return state.folderList;
    }
  }

  FutureOr<void> _onFmFolderStatusUpdateEvent(
      _FmFolderFetchStatusUpdateEvent event,
      Emitter<_FolderState> emit
      )async{
    _blocRepositoryOfFileDownloader.onNavigationToNewFolder();

    switch(event.fmFolderFetchStatus){
      case FmFolderFetchStatusEnum.fetched:
        return emit(state.copyWith(
            fmFolderFetchStatus: FmFolderFetchStatusEnum.fetched,
            folderList: await _getUpdatedAndMergedFolderList(),
            currentFolderPath: _blocRepositoryOfFolderOperations.path
        ));
      case FmFolderFetchStatusEnum.initialState:
      case FmFolderFetchStatusEnum.fetching:
      case FmFolderFetchStatusEnum.failedDueUnknownReason:
      case FmFolderFetchStatusEnum.failedDueAuthTokenError:
      case FmFolderFetchStatusEnum.failedDueHttpResponseCode401:
      case FmFolderFetchStatusEnum.failedDueHttpResponseCode404:
      default:
        return emit(state.copyWith(
            fmFolderFetchStatus: event.fmFolderFetchStatus,
            currentFolderPath: _blocRepositoryOfFolderOperations.path
        ));
    }
  }

  FutureOr<void> _onFmFileDownloaderStatusUpdate(
      _FmFileDownloaderStatusUpdateEvent event,
      Emitter<_FolderState> emit
      )async{
    switch(event.fmFileDownloadStatusEnum){
      case FmFileDownloadStatusEnum.fileDownloadCompleted:
      case FmFileDownloadStatusEnum.initialState:
      case FmFileDownloadStatusEnum.fileDownloading:
      case FmFileDownloadStatusEnum.failedDueUnknownReason:
      case FmFileDownloadStatusEnum.failedDueAuthTokenError:
      case FmFileDownloadStatusEnum.failedDueHttpResponseCode404:
      default:
      return emit(
          state.copyWith(
              lastDownloadedFileName: _blocRepositoryOfFileDownloader.lastDownloadedFileName,
              lastDownloadedFileExtension: _blocRepositoryOfFileDownloader.lastDownloadedFileExtension,
              fmFileDownloadStatusEnum: event.fmFileDownloadStatusEnum
          )
      );
    }
  }


  FutureOr<void> _onFmFileDownloaderIndicatorPercentUpdate(
      _FmFileDownloaderIndicatorPercentUpdateEvent event,
      Emitter<_FolderState> emit
  )async{
    print("_FmFileDownloaderIndicatorPercentUpdateEvent: ${DateTime.now()}");

    return emit(state.copyWith(downloadIndicatorPercent: event.fileDownloadPercent));
  }


  FutureOr<void> _onFmFolderFetchEvent(
     _FmFolderFetchEvent event,
     Emitter<_FolderState> emit
  )async{
    await _onFolderChangeDownloadedFileInfoClearer();
    await _blocRepositoryOfFolderOperations.fetchFolder(folderPath: event.folderPath);
  }

  FutureOr<void> startFmLogin()async{
    await _onFolderChangeDownloadedFileInfoClearer();
    _blocRepositoryOfFmLogin.startFmLogin();
  }

  FutureOr<void> refreshCurrentFolder()async{
    await _onFolderChangeDownloadedFileInfoClearer();
    await _blocRepositoryOfFolderOperations.fetchFolder(
        folderPath: _blocRepositoryOfFolderOperations.path ?? "/"
    );
  }

  FutureOr<void> navigateToPreviousFolder()async{
    await _onFolderChangeDownloadedFileInfoClearer();
    await _blocRepositoryOfFolderOperations.fetchFolder(
        folderPath: _blocRepositoryOfFolderOperations.previousPath ?? "/"
    );
  }

  FutureOr<void> navigateToRootFolder()async{
    await _onFolderChangeDownloadedFileInfoClearer();
    await _blocRepositoryOfFolderOperations.fetchFolder(folderPath: "/");
  }

  FutureOr<void> navigateToFolderWithFolderPath(String folderPath)async{
    await _onFolderChangeDownloadedFileInfoClearer();
    await _blocRepositoryOfFolderOperations.fetchFolder(folderPath: folderPath);
  }

  FutureOr<void> startToDownloadAFile({
    required String fileName,
    required String fileExtension,
    required String fileFullPath
  })async=>_blocRepositoryOfFileDownloader.downloadFileFromServer(
      fileName: fileName,
      fileExtension: fileExtension,
      fileFullPath: fileFullPath
  );


  FutureOr<void> openFolder({
    required BuildContext context,
    required String fileName,
    required String fileExtension
  })async{
    try{
      final String _fileSavePath=await LocalStorageService.instance.getAppDirectoryPathWithSubDirectoryPath(
          subDirectory: LocalStorageConstants.fileFolder
      );

      OpenResult _result=await OpenFile.open("${_fileSavePath+"/"+fileName+fileExtension}");

      switch(_result.type){
        case(ResultType.done):CustomSnackBar(context, LocaleKeys.folderView_snackBar_fileSuccessfullyOpened.tr(), isSuccess: false).show;break;
        case(ResultType.fileNotFound):CustomSnackBar(context, LocaleKeys.folderView_snackBar_fileNotFoundOnDisk.tr(), isSuccess: false).show;break;
        case(ResultType.noAppToOpen):CustomSnackBar(context, LocaleKeys.folderView_snackBar_weCouldNotDetectAnyAppCanOpenThisFile.tr(), isSuccess: false).show;break;
        case(ResultType.permissionDenied):CustomSnackBar(context, LocaleKeys.folderView_snackBar_fileOpenerPermissionsDenied.tr(), isSuccess: false).show;break;
        case(ResultType.error):CustomSnackBar(context, LocaleKeys.folderView_snackBar_fileCouldNotOpened.tr(), isSuccess: false).show;break;
      }
    }catch(e){
      debugPrint("error on folder - finance bloc / openFolder");
      CustomSnackBar(context, LocaleKeys.folderView_snackBar_fileCouldNotOpened.tr(), isSuccess: false).show;
    }
  }

  FutureOr<void> _onFolderChangeDownloadedFileInfoClearer()async{
    _blocRepositoryOfFileDownloader.lastDownloadedFileName=null;
    _blocRepositoryOfFileDownloader.lastDownloadedFileExtension=null;
    emit(
        state.copyWith(
            lastDownloadedFileName: "----------",
            downloadIndicatorPercent: 0,
            lastDownloadedFileExtension: "----------"
        )
    );
  }


  @override
  Future<void> close() {
    _fmLoginStatusStreamSubscription.cancel();
    _fmFolderFetchStatusStreamsSubscription.cancel();
    _fmFileDownloaderStatusStreamSubscription.cancel();
    _fmFileDownloaderIndicatorPercentStreamSubscription.cancel();
    _blocRepositoryOfFmLogin.dispose();
    _blocRepositoryOfFolderOperations.dispose();
    _blocRepositoryOfFileDownloader.dispose();
    return super.close();
  }
}