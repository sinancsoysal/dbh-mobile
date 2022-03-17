import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'variables/finance_folder_button_sizes.dart';
part 'variables/finance_folder_button_variables.dart';

part 'components/finance_folder_button_folder_icon.dart';
part 'components/finance_folder_button_text.dart';
part 'components/finance_folder_button_icon.dart';

typedef FutureVoidFunction=Future<void> Function();

class FolderViewFolderButton extends GestureDetector {
  FolderViewFolderButton({
    Key? key,
    required String folderName,
    required FutureVoidFunction onTap
  }) : super(
    key: key,
    onTap: onTap,
    child: SizedBox(
      height: _FolderViewFolderButtonSizes.instance._folderViewFolderButtonHeight,
      child: Padding(
        padding: _FolderViewFolderButtonVariables.instance.folderViewFolderButtonPadding,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _FolderViewFolderButtonFolderIcon(),
            Expanded(child: _FolderViewFolderButtonText(folderName: folderName)),
            //_FinanceFolderButtonIcon()
          ],
        ),
      ),

    )
  );
}
