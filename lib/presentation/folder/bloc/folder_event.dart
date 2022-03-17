part of '../view/folder_view.dart';

abstract class _FolderEvent extends Equatable{
  const _FolderEvent();

  @override
  List<Object?> get props => [];
}

class _FmLoginStartEvent extends _FolderEvent{
  const _FmLoginStartEvent();

  @override
  List<Object?> get props=>[];
}

class _FmLoginStatusUpdateEvent extends _FolderEvent{
  const _FmLoginStatusUpdateEvent({required this.fmLoginStatus});

  final FmLoginStatusEnum fmLoginStatus;

  @override
  List<Object?> get props=>[
    fmLoginStatus
  ];
}


class _FmFolderFetchEvent extends _FolderEvent{
  const _FmFolderFetchEvent({required this.folderPath});

  final String folderPath;

  @override
  List<Object?> get props=>[
    folderPath
  ];
}

class _FmFolderFetchStatusUpdateEvent extends _FolderEvent{
  const _FmFolderFetchStatusUpdateEvent({required this.fmFolderFetchStatus});

  final FmFolderFetchStatusEnum fmFolderFetchStatus;

  @override
  List<Object?> get props=>[
    fmFolderFetchStatus
  ];
}

class _FmFileDownloaderStatusUpdateEvent extends _FolderEvent{
  const _FmFileDownloaderStatusUpdateEvent({
    required this.fmFileDownloadStatusEnum
  });

  final FmFileDownloadStatusEnum fmFileDownloadStatusEnum;

  @override
  List<Object?> get props=>[
    fmFileDownloadStatusEnum
  ];
}

class _FmFileDownloaderIndicatorPercentUpdateEvent extends _FolderEvent{
  const _FmFileDownloaderIndicatorPercentUpdateEvent({required this.fileDownloadPercent});

  final int fileDownloadPercent;

  @override
  List<Object?> get props=>[
    fileDownloadPercent
  ];
}

