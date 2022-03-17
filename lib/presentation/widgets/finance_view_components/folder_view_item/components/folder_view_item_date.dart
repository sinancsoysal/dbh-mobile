part of '../folder_view_item.dart';

class _FolderViewItemDate extends SizedBox{
  _FolderViewItemDate({
    Key? key,
    required DateTime? dateTime
  }) : super(
    key: key,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
            left: 5.0.w,
            right: 10.0.w
        ),
        child: FontText.inter(
          text: dateTime?.dateTimeToStringWithTimeZone??"",
          translate: false,
          fontSize: 10.0,
          color: ColorConstants.instance.darkPrimaryBlue,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.right,
        ),
      )
  );
}
