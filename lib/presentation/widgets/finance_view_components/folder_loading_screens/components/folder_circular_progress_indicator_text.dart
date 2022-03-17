part of '../folder_loading_screens.dart';

class _FolderCircularProgressIndicatorText extends SizedBox {
  _FolderCircularProgressIndicatorText({
    Key? key,
    required String textLocaleKey
  }) : super(
    key: key,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0.w),
      child: FontText.inter(
        text: textLocaleKey,
        color: Colors.black,
        textAlign: TextAlign.center,
        fontSize: 14,
        translate: true
      ),
    )
  );
}
