part of '../folder_view_folder_button.dart';

class _FolderViewFolderButtonIcon extends Padding {
  _FolderViewFolderButtonIcon({
    Key? key
  }) : super(
    key: key,
    padding: EdgeInsets.symmetric(horizontal: 5.0.w),
    child: Icon(
      Icons.arrow_forward_ios_rounded,
      color: Colors.black,
      size: _folderViewFolderButtonFolderIconSize*0.5,
    )
  );
}