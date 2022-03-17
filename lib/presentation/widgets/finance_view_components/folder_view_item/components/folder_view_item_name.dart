part of '../folder_view_item.dart';

class _FolderViewItemName extends Expanded{
  _FolderViewItemName({
    Key? key,
    required String itemName
  }) : super(
    key: key,
    child: Center(
      child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: _FolderViewItemVariables.instance.folderViewItemNamePadding,
            child: FontText.inter(
                text: itemName,
                translate: false,
                fontSize: 14.0,
                color: ColorConstants.instance.darkPrimaryBlue,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 2
            ),
          )
      ),
    )
  );
}
