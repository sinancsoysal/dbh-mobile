import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:mobile/presentation/widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/utils/constants/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'variables/folder_view_items_fetch_error_screen_variables.dart';
part 'variables/folder_view_items_fetch_error_screen_sizes.dart';

part 'components/folder_view_screen_center_icon.dart';
part 'components/folder_view_screen_center_title.dart';
part 'components/folder_view_screen_center_detail_text.dart';
part 'components/folder_view_screen_center_text_button.dart';

class FolderViewResultScreen extends SizedBox {
  FolderViewResultScreen.nullFolderScreen({
    Key? key
  }):super(
    key: key,
    width: double.infinity,
    height: double.infinity,
    child: _folderViewResultScreenFrame(
        icon: Icons.snippet_folder,
        titleLocaleKey: LocaleKeys.folderView_nullOrEmptyFile_nullFolder,
        detailLocaleKey: LocaleKeys.folderView_nullOrEmptyFile_itLooksLikeWeCouldNotFoundTheFolder
    )
  );

  FolderViewResultScreen.emptyItemListScreen({
    Key? key
  }):super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderViewResultScreenFrame(
          icon: Icons.snippet_folder,
          titleLocaleKey: LocaleKeys.folderView_nullOrEmptyFile_foldersAndItemsAreNotExist,
          detailLocaleKey: LocaleKeys.folderView_nullOrEmptyFile_itLooksLikeThisFolderDoesNotHaveAnyFolderOrFile
      )
  );
}

Column _folderViewResultScreenFrame({
  required IconData icon,
  required String titleLocaleKey,
  required String detailLocaleKey
})=>Column(
  mainAxisSize: MainAxisSize.max,
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const Spacer(flex: 1),
    _FolderViewScreenCenterIcon(icon: icon),
    SizedBox(height: 5.0.h),
    _FolderViewScreenCenterTitle(localeKey: titleLocaleKey),
    _FolderViewCenterDetailText(localeKey: detailLocaleKey),
    const Spacer(flex: 5)
  ],
);
