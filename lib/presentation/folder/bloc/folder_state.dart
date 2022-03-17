part of '../view/folder_view.dart';

class _FolderState extends Equatable{
  final FmLoginStatusEnum fmLoginStatus;
  final FmFolderFetchStatusEnum fmFolderFetchStatus;
  final FmFileDownloadStatusEnum fmFileDownloadStatusEnum;

  final String currentFolderPath;
  final List<FmDbhApiFolder?> _folderList;
  List<FmDbhApiFolder?> get folderList=>_folderList;

  final String lastDownloadedFileName;
  final String lastDownloadedFileExtension;
  final int downloadIndicatorPercent;

  FmDbhApiFolder? get currentFolder{
    final int _currentFolderIndex=_folderList.indexWhere((element){
      if(currentFolderPath==""||currentFolderPath=="/"){
        return element!=null&&(element.path=="/"||element.path=="");
      }else{
        return element!=null&&element.path==currentFolderPath;
      }
    });

    if(_currentFolderIndex==-1||_folderList.length<=_currentFolderIndex){
      return null;
    }else{
      return _folderList[_currentFolderIndex];
    }
  }

  const _FolderState({
    this.fmLoginStatus=FmLoginStatusEnum.initialState,
    this.fmFolderFetchStatus=FmFolderFetchStatusEnum.initialState,
    this.fmFileDownloadStatusEnum=FmFileDownloadStatusEnum.initialState,
    required List<FmDbhApiFolder?>? folderList,
    this.currentFolderPath = "/",
    this.lastDownloadedFileName = "",
    this.lastDownloadedFileExtension = "",
    this.downloadIndicatorPercent=0,
  }):_folderList=folderList??const [];

  _FolderState copyWith({
    FmLoginStatusEnum? fmLoginStatus,
    FmFolderFetchStatusEnum? fmFolderFetchStatus,
    FmFileDownloadStatusEnum? fmFileDownloadStatusEnum,
    String? currentFolderPath,
    List<FmDbhApiFolder?>? folderList,
    String? lastDownloadedFileName,
    String? lastDownloadedFileExtension,
    int? downloadIndicatorPercent
  }) {
    return _FolderState(
        folderList: folderList ?? _folderList,
        fmFolderFetchStatus: fmFolderFetchStatus ?? this.fmFolderFetchStatus,
        fmLoginStatus: fmLoginStatus ?? this.fmLoginStatus,
        currentFolderPath: currentFolderPath ?? this.currentFolderPath,
        fmFileDownloadStatusEnum: fmFileDownloadStatusEnum ?? this.fmFileDownloadStatusEnum,
        lastDownloadedFileName: lastDownloadedFileName ?? this.lastDownloadedFileName,
        lastDownloadedFileExtension: lastDownloadedFileExtension ?? this.lastDownloadedFileExtension,
        downloadIndicatorPercent: downloadIndicatorPercent ?? this.downloadIndicatorPercent
    );
  }

  @override
  List<Object> get props => [
    fmLoginStatus,
    fmFolderFetchStatus,
    fmFileDownloadStatusEnum,
    currentFolderPath,
    _folderList,
    lastDownloadedFileName,
    lastDownloadedFileExtension,
    downloadIndicatorPercent
  ];
}