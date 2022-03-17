part of '../folder_view_result_screen.dart';

class _FolderViewScreenCenterTextButton extends GestureDetector {
  _FolderViewScreenCenterTextButton({
    Key? key,
    required VoidCallback onTap,
    required String localeKey
  }) : super(
      key: key,
      child: Container(
        margin: EdgeInsets.only(top: 5.0.h),
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 12.0.w),
        decoration: BoxDecoration(
          gradient: ColorConstants.instance.primaryBlueGradientLinear,
          borderRadius: BorderRadius.circular(4.0.w),
        ),
        child: FontText.jost(
          text: localeKey,
          translate: true,
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
      )
  );
}