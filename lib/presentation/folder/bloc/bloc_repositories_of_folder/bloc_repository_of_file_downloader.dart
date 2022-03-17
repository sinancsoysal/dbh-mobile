part of '../../view/folder_view.dart';

class _BlocRepositoryOfFileDownloader{
  _BlocRepositoryOfFileDownloader({
    required BuildContext context,
    required Dio dio
  }):_dio=dio,_context=context;

  final BuildContext _context;
  final Dio _dio;
  String? lockKey;
  String? lastDownloadedFileName;
  String? lastDownloadedFileExtension;

  final StreamController<FmFileDownloadStatusEnum> _fileDownloaderStatusStreamController=StreamController<FmFileDownloadStatusEnum>();
  Stream<FmFileDownloadStatusEnum> get fileDownloaderStatusStream async* {
    yield* _fileDownloaderStatusStreamController.stream;
  }

  final StreamController<int?> _fileDownloaderIndicatorPercentStreamController = StreamController<int?>();
  Stream<int?> get fileDownloaderIndicatorPercentStatusStream async* {
    yield* _fileDownloaderIndicatorPercentStreamController.stream;
  }

  String get _authToken=>PreferencesManager.instance.getStringValue(PreferencesKeys.fmDbhAuthToken);

  ///When user change the current folder, call this function.
  ///In this way, we can change the lock key and if any file download process exist,
  ///our state won't be update because our lockKey will become different with
  ///local _lockKey at downloadFileFromServer() function.
  ///And also, if any download process exist, we will clean the download process
  ///states with this function.
  void onNavigationToNewFolder(){
    lockKey="".generateRandomString(8);
    _fileDownloaderStatusStreamController.add(FmFileDownloadStatusEnum.initialState);
    _fileDownloaderIndicatorPercentStreamController.add(0);
  }

  void _onFileReceiveProgress(int received, int total){

    debugPrint("_onFileReceiveProgress ${DateTime.now()} -> ${((received / total) * 100).floor()}");
    if (total != -1 && total != 0) {
      _fileDownloaderIndicatorPercentStreamController.add(((received / total) * 100).floor());
    }
  }

  ///[fileName] - using for showing customSnackBar and saving the download info to sharedPreferences
  ///at _saveTheDownloadedFileNameToSharedPreferences function in this file.
  Future<void> downloadFileFromServer({
    required String fileName,
    required String fileExtension,
    required String fileFullPath
  })async{
    debugPrint("downloadFileFromServer1 ${DateTime.now()}");
    String _lockKey="".generateRandomString(8);
    lockKey=_lockKey;

    _fileDownloaderStatusStreamController.add(FmFileDownloadStatusEnum.fileDownloading);

    lastDownloadedFileName=fileName;
    lastDownloadedFileExtension=fileExtension;

    debugPrint("downloadFileFromServer: $fileName $fileExtension $fileFullPath");

    await _checkOlderRecordedFilesAndDeleteThem();

    debugPrint("downloadFileFromServer2 ${DateTime.now()}");

    final String _fileSavePath=await LocalStorageService.instance.getAppDirectoryPathWithSubDirectoryPath(
        subDirectory: LocalStorageConstants.fileFolder
    );

    try{
      final _response=await _dio.download(
          FmDbhApiRouteConstants.BASE_URL
              +FmDbhApiRouteConstants.raw
              +fileFullPath
              +"?auth="+_authToken,
          "${_fileSavePath+"/"+fileName+fileExtension}",
          onReceiveProgress: (int received, int total){
            if(_lockKey==lockKey){
              _onFileReceiveProgress(received, total);
            }
          }
      );

      if(_response.statusCode!=null&&_response.statusCode==200){
        await _saveTheDownloadedFileNameAndExtensionToSharedPreferences(fileName, fileExtension);

        if(_lockKey==lockKey){
          _fileDownloaderStatusStreamController.add(FmFileDownloadStatusEnum.fileDownloadCompleted);
        }
      }else{
        if(_lockKey==lockKey){
          _downloadErrorManager(statusCode: _response.statusCode, dioError: null);
        }
      }
    }catch(e){
      debugPrint("Error on(bloc_repository_of_file_downloader - downloadFileFromServer): ${e.toString()}");
      if(e is DioError){
        _downloadErrorManager(statusCode: null, dioError: e);
      }else{
        CustomSnackBar(_context, LocaleKeys.folderView_snackBar_errorFileCouldNotDownloadDueUnknownReasons.tr(), isSuccess: false).show;
        _fileDownloaderStatusStreamController.add(FmFileDownloadStatusEnum.failedDueUnknownReason);
      }
    }

  }


  void _downloadErrorManager({
    required int? statusCode,
    required DioError? dioError
  }){
    late int? _statusCode;
    if(dioError!=null){
      _statusCode=dioError.response?.statusCode;
    }else{
      _statusCode=statusCode;
    }

    late final String _snackBarErrorMessage;
    switch(_statusCode){
      case 403:
        _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorFileCouldNotDownloadDueAuthKeyError.tr();
        _fileDownloaderStatusStreamController.add(FmFileDownloadStatusEnum.failedDueAuthTokenError);
        break;
      case 404:
        _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorFileCouldNotDownloadDueDeletedOrMissingFile.tr();
        _fileDownloaderStatusStreamController.add(FmFileDownloadStatusEnum.failedDueHttpResponseCode404);
        break;
      default:
        _snackBarErrorMessage=LocaleKeys.folderView_snackBar_errorFileCouldNotDownloadDueUnknownReasons.tr();
        _fileDownloaderStatusStreamController.add(FmFileDownloadStatusEnum.failedDueUnknownReason);
    }

    CustomSnackBar(_context, _snackBarErrorMessage, isSuccess: false).show;
  }

  ///After any file download complete, file name and file extension will save to
  ///shared preferences downloaded file name list. In this way, we can be ensure
  ///which files downloaded and which files needed to delete.
  Future<void> _saveTheDownloadedFileNameAndExtensionToSharedPreferences(String fileName, String fileExtension)async{
    final List<String> _downloadedAndSavedFileNameList=PreferencesManager.instance.getStringList(
        PreferencesKeys.downloadedFilesNameList
    );

    if(!_downloadedAndSavedFileNameList.contains((fileName+fileExtension))){
      await PreferencesManager.instance.setStringList(
          PreferencesKeys.downloadedFilesNameList,
          _downloadedAndSavedFileNameList..add(fileName+fileExtension)
      );
    }
  }

  ///_checkOlderRecordedFilesAndDeleteThem function calling when new item download operation and
  ///this function checking saved file and file names
  ///if any file downloaded exist, deleting it and after the delete operation
  ///calls to _updateDeletedFileRecordsFromSharedPreferences function and
  ///updates to fileNameListFromSharedPreferences.
  Future<void> _checkOlderRecordedFilesAndDeleteThem()async{
    final List<String> _downloadedAndSavedFileNameList=PreferencesManager.instance.getStringList(
        PreferencesKeys.downloadedFilesNameList
    );

    final List<String> _deletedDownloadedFileNameList=[];

    for(String fileNameWithExtension in _downloadedAndSavedFileNameList){
      final String _fileExtension= fileNameWithExtension.fileExtension??"";
      final String _fileNameWithoutExtension=fileNameWithExtension.fileNameWithoutExtension(
          fileExtension: _fileExtension
      )??"";

      final bool isFileExist=await LocalStorageService.instance.isFileExist(
          fileName: _fileNameWithoutExtension,
          extension: _fileExtension,
          subDirectory: LocalStorageConstants.fileFolder
      );

      if(isFileExist){
        final bool isFileDeleted=await LocalStorageService.instance.deleteFile(
            fileName: _fileNameWithoutExtension,
            extension: _fileExtension,
            subDirectory: LocalStorageConstants.fileFolder
        );


        if(isFileDeleted){
          _deletedDownloadedFileNameList.add(fileNameWithExtension);
        }
      }else{
        _deletedDownloadedFileNameList.add(fileNameWithExtension);
      }
    }

    await _updateDeletedFileRecordsFromSharedPreferences(_deletedDownloadedFileNameList);
  }

  ///_updateDeletedFileRecordsFromSharedPreferences function
  ///removes file names from shared preferences.
  Future<void> _updateDeletedFileRecordsFromSharedPreferences(List<String> deletedNameList)async{
    final List<String> _currentDownloadedFileNameList=PreferencesManager.instance.getStringList(
        PreferencesKeys.downloadedFilesNameList
    );

    _currentDownloadedFileNameList.removeWhere((element) => deletedNameList.contains(element));

    await PreferencesManager.instance.setStringList(
        PreferencesKeys.downloadedFilesNameList,
        _currentDownloadedFileNameList
    );
  }


  Future<void> dispose()async{
    await _fileDownloaderStatusStreamController.close();
    await _fileDownloaderIndicatorPercentStreamController.close();
  }
}