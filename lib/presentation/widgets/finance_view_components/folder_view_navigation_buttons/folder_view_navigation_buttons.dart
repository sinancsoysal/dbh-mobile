import 'dart:async' show FutureOr;

import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:mobile/core/utils/extensions/folder_path/folder_path_extension.dart';
import 'package:mobile/presentation/widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'variables/folder_view_navigation_buttons_sizes.dart';
part 'variables/folder_view_navigation_buttons_variables.dart';

part 'components/folder_view_navigation_button.dart';
part 'components/folder_view_navigation_current_path_title.dart';

class FolderViewNavigationButtons extends SizedBox {

  const FolderViewNavigationButtons.atRootFolder({Key? key}):super.shrink(key: key);

  FolderViewNavigationButtons({
    Key? key,
    required String currentFolderPath,
    required FutureOr<void> Function() rootFolderNavigatorFunction,
    required FutureOr<void> Function() previousFolderNavigatorFunction,
  }) : super(
    key: key,
    child: Row(
      children: [
        Expanded(
            child: currentFolderPath=="/"
                ?const _FolderViewNavigationCurrentPathTitle.shrink()
                :_FolderViewNavigationCurrentPathTitle(
                folderPath: currentFolderPath.currentFolderNameFromPath
            )
        ),
        _FolderViewNavigationButton.previousFolderNavigatorButton(
            navigatorFunction: previousFolderNavigatorFunction
        ),
        _FolderViewNavigationButton.rootFolderNavigatorButton(navigatorFunction: rootFolderNavigatorFunction)
      ],
    )
  );

}
