part of '../folder_error_screens.dart';

class _FolderErrorTitle extends SizedBox {
  _FolderErrorTitle({
    Key? key,
    required String titleLocaleKey
  }) : super(
    key: key,
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 35.0.w
      ),
      child: FontText.jost(
        text: titleLocaleKey,
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        translate: true,
        textAlign: TextAlign.center
      ),
    )
  );
}
