part of '../folder_view_folder_button.dart';

class _FolderViewFolderButtonText extends Text {
  _FolderViewFolderButtonText({
    Key? key,
    required String folderName
  }) : super(
    folderName,
    style: TextStyle(
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 16.0.w,
        color: Colors.black
    ),
    textAlign: TextAlign.left,
    key: key
  );
}
