part of '../folder_view_result_screen.dart';

class _FolderViewScreenCenterTitle extends SizedBox {
  _FolderViewScreenCenterTitle({
    Key? key,
    required String localeKey
  }) : super(
    key: key,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 48.0.w, vertical: 5.h),
      child: FontText.jost(
        text: localeKey,
        translate: true,
        color: Colors.black,
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center,
      ),
    )
  );
}
