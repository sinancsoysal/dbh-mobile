part of '../folder_error_screens.dart';

class _FolderErrorButton extends IgnorePointer {
  _FolderErrorButton({
    Key? key,
    required String buttonTextLocaleKey,
    required FutureOr<void> Function() onTap
  }) : super(
      key: key,
      ignoring: false,
      child: _folderErrorButton(
          onTap: onTap,
          child: FontText.jost(
            text: buttonTextLocaleKey,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            translate: true,
            fontSize: 14.0,
          )
      )
  );

  _FolderErrorButton.loading({
    Key? key,
    required FutureOr<void> Function() onTap
  }) : super(
      key: key,
      ignoring: true,
      child: _folderErrorButton(
          onTap: onTap,
          child: FractionallySizedBox(
            heightFactor: 0.8,
            child: AspectRatio(
              aspectRatio: 1,
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: ColorConstants.instance.darkPrimaryBlue
              ),
            ),
          )
      )
  );
}


GestureDetector _folderErrorButton({
  required Widget child,
  required FutureOr<void> Function() onTap
})=>GestureDetector(
  onTap: onTap,
  child: Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12.h)),
        gradient: ColorConstants.instance.primaryBlueGradientLinear
    ),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.0.h),
    margin: EdgeInsets.symmetric(horizontal: 60.0.w),
    alignment: Alignment.center,
    child: child,
  ),
);
