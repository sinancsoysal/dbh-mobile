part of '../folder_loading_screens.dart';

class _FolderCircularProgressIndicator extends SizedBox {
  _FolderCircularProgressIndicator({
    Key? key
  }) : super.square(
      key: key,
      dimension: 50.sp,
      child: CircularProgressIndicator(
        strokeWidth: 4.h,
        color: Colors.black,
        backgroundColor: Colors.black.withOpacity(.5),
      )
  );
}
