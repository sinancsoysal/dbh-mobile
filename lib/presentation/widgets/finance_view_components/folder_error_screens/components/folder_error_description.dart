part of '../folder_error_screens.dart';

class _FolderErrorDescription extends SizedBox {
  _FolderErrorDescription({
    Key? key,
    required String descriptionLocaleKey
  }) : super(
      key: key,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 25.0.w
        ),
        child: FontText.inter(
            text: descriptionLocaleKey,
            color: Colors.grey[900],
            fontSize: 13,
            fontWeight: FontWeight.w400,
            translate: true,
            textAlign: TextAlign.center
        ),
      )
  );

}
