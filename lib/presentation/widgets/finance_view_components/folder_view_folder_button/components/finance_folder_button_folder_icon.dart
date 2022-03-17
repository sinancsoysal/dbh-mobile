part of '../folder_view_folder_button.dart';

double get _folderViewFolderButtonFolderIconSize=>
    (_FolderViewFolderButtonSizes.instance._folderViewFolderButtonHeight
        -_FolderViewFolderButtonVariables.instance.folderViewFolderButtonPadding.vertical)*0.8;

class _FolderViewFolderButtonFolderIcon extends Container{
  _FolderViewFolderButtonFolderIcon({
    Key? key
  }) : super(
    key: key,
    height: _folderViewFolderButtonFolderIconSize,
    width: _folderViewFolderButtonFolderIconSize,
    margin: EdgeInsets.only(right: 8.0.w),
    decoration: BoxDecoration(
        gradient: ColorConstants.instance.primaryBlueGradientLinear,
        borderRadius: BorderRadius.all(Radius.circular(_folderViewFolderButtonFolderIconSize*0.2))
    ),
    child: const FractionallySizedBox(
      heightFactor: 0.7,
      child: FittedBox(
        alignment: Alignment.center,
        child: Icon(
          Icons.folder,
          color: Colors.white,
        ),
      ),
    )
  );
}
