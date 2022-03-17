part of '../folder_view_item.dart';

class _FolderViewItemSizes{
  static final _FolderViewItemSizes _instance=_FolderViewItemSizes._();
  static _FolderViewItemSizes get instance=>_instance;
  _FolderViewItemSizes._();

  double get folderViewItemHeight=>75.0.r;
  double get folderViewItemChildHeight=>folderViewItemHeight-_FolderViewItemVariables.instance.folderViewItemItemPadding.vertical;
}