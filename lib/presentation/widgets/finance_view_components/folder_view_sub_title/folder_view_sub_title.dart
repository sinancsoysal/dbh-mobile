import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:mobile/presentation/widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'variables/folder_view_sub_title_sizes.dart';
part 'variables/folder_view_sub_title_variables.dart';

typedef FutureVoidFunction=Future<void> Function();

class FolderViewSubTitle extends SizedBox {
  FolderViewSubTitle({
    Key? key,
    required String subTitle,
  }) : super(
      key: key,
      width: double.infinity,
      child: Padding(
        padding: _FolderViewSubTitleVariables.instance.folderViewSubTitlePadding,
        child: _folderViewSubTitleText(subTitle),
      )
  );
}

FontText _folderViewSubTitleText(String title)=>FontText.inter(
  text: title,
  translate: false,
  fontWeight: FontWeight.w600,
  fontSize: 18.0,
  color: ColorConstants.instance.darkPrimaryBlue,
  textAlign: TextAlign.left,
);
