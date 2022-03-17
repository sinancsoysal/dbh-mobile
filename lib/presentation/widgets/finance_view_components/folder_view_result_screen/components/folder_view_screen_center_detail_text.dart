part of '../folder_view_result_screen.dart';

class _FolderViewCenterDetailText extends SizedBox {
  _FolderViewCenterDetailText({
    Key? key,
    required String localeKey
  }) : super(
      key: key,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
            left: 24.0.w,
            right: 24.0.w,
            bottom: 10.0.h
        ),
        child: FontText.inter(
          text: localeKey,
          translate: true,
          color: Colors.black,
          fontSize: 13.0,
          fontWeight: FontWeight.w400,
          textAlign: TextAlign.center,
        ),
      )
  );
}