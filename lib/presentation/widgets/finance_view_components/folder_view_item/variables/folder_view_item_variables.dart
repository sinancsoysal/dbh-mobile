part of '../folder_view_item.dart';

class _FolderViewItemVariables{
  static final _FolderViewItemVariables _instance=_FolderViewItemVariables._();
  static _FolderViewItemVariables get instance=>_instance;
  _FolderViewItemVariables._();


  EdgeInsets get folderViewItemMargin=>EdgeInsets.only(
      left: 35.0.w,
      right: 35.0.w,
      bottom: 15.0.h
  );

  ///[folderViewItemItemPadding] : this padding using for,
  /// file name, uploader name, date texts default padding.
  EdgeInsets get folderViewItemItemPadding=>EdgeInsets.only(
    left: 5.0.w,
    right: 10.0.w
  );

  EdgeInsets get folderViewItemNamePadding=>EdgeInsets.only(
      left: 5.0.w,
      right: 10.0.w
  );

  BorderRadius get _folderViewItemButtonBorderRadius=> BorderRadius.circular(2.5.h);
  BoxDecoration folderViewItemButtonDecoration(bool isButtonActive){
    if(isButtonActive){
      return  BoxDecoration(
         gradient: ColorConstants.instance.primaryBlueGradientLinear,
         borderRadius: _folderViewItemButtonBorderRadius
      );
    }else{
      return BoxDecoration(
        borderRadius: _folderViewItemButtonBorderRadius,
        color: ColorConstants.instance.darkGray
      );
    }
  }
}