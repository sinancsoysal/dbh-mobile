part of '../folder_view_item.dart';

class _FolderViewItemButton extends Expanded {
  _FolderViewItemButton.activeButton({
    Key? key,
    required String textLocaleKey,
    required FutureOr<void>? Function() buttonOnTap
  }) : super(
      key: key,
      child: _folderViewItemButton(
        textLocaleKey: textLocaleKey,
        buttonOnTap: buttonOnTap,
        isButtonActive: true
      )
  );

  _FolderViewItemButton.notActive({
    Key? key,
    required String textLocaleKey
  }) : super(
      key: key,
      child: _folderViewItemButton(
          textLocaleKey: textLocaleKey,
          buttonOnTap: null,
          isButtonActive: false
      )
  );
}

Align _folderViewItemButton({
  required String textLocaleKey,
  required bool isButtonActive,
  required FutureOr<void> Function()? buttonOnTap
})=>Align(
  alignment: Alignment.centerRight,
  child: GestureDetector(
    onTap: buttonOnTap,
    child: Container(
      decoration: _FolderViewItemVariables.instance.folderViewItemButtonDecoration(isButtonActive),
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 2.5.h),
      child: FontText.inter(
        text: textLocaleKey,
        translate: true,
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.center,
      ),
    ),
  ),
);
