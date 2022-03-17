part of '../folder_error_screens.dart';

class _FolderErrorIcon extends Container {
  _FolderErrorIcon({
    Key? key,
    required String iconAssetPath
  }) : super(
      key: key,
      width: 48.h,
      height: 48.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.h)),
        gradient: ColorConstants.instance.primaryBlueGradientLinear
      ),
      child: Image.asset(
        iconAssetPath,
        height: 30.h,
        width: 30.h,
        color: Colors.white,
       alignment: Alignment.center,
      )
  );
}
