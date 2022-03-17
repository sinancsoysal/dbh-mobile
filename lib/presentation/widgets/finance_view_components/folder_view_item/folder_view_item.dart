import 'dart:async' show FutureOr;

import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:mobile/core/utils/extensions/file_extension/file_extension.dart';
import 'package:mobile/presentation/widgets/common/common_step_progress_indicator.dart';
import 'package:mobile/presentation/widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/utils/constants/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobile/core/utils/extensions/datetime/datetime_extension.dart';

part 'variables/folder_view_item_sizes.dart';
part 'variables/folder_view_item_variables.dart';

part 'components/folder_view_item_icon.dart';
part 'components/folder_view_item_date.dart';
part 'components/folder_view_item_name.dart';
part 'components/folder_view_item_button.dart';

typedef FutureVoidFunction=Future<void> Function();

class FolderViewItem extends IgnorePointer {
  FolderViewItem({
    Key? key,
    required FutureVoidFunction onButtonTap,
    required String itemName,
    required String extension,
    required DateTime? modifiedDateTime
  }) : super(
    key: key,
    ignoring: false,
    child: _folderViewItemFrame(
      financeItemIcon: _FolderViewItemIcon(extension: extension),
      children: [
        SizedBox(height: 7.5.h),
        _FolderViewItemDate(dateTime: modifiedDateTime),
        _FolderViewItemName(itemName: itemName),
        if(extension.canFileExtensionOpenable)
          _FolderViewItemButton.activeButton(
            textLocaleKey: LocaleKeys.folderView_download,
            buttonOnTap: onButtonTap
          )
        else
          _FolderViewItemButton.notActive(
              textLocaleKey: LocaleKeys.folderView_canNotOpen
          )
      ]
    )
  );

  FolderViewItem.downloading({
    Key? key,
    required String itemName,
    required DateTime? modifiedDateTime,
    required int currentStep,
    required int totalStep
  }) : super(
      key: key,
      ignoring: true,
      child: _folderViewItemFrame(
          financeItemIcon: _FolderViewItemIcon.downloading(
              currentStep: currentStep,
              totalStep: totalStep
          ),
          children: [
            SizedBox(height: 7.5.h),
            _FolderViewItemDate(dateTime: modifiedDateTime),
            _FolderViewItemName(itemName: itemName),
            _FolderViewItemButton.notActive(
                textLocaleKey: LocaleKeys.folderView_downloading
            )
          ]
      )
  );

  FolderViewItem.downloaded({
    Key? key,
    required FutureVoidFunction openTheFileFunction,
    required String itemName,
    required DateTime? modifiedDateTime,
    required int currentStep,
    required int totalStep
  }) : super(
      key: key,
      ignoring: false,
      child: _folderViewItemFrame(
          financeItemIcon: _FolderViewItemIcon.downloading(
              currentStep: currentStep,
              totalStep: totalStep
          ),
          children: [
            SizedBox(height: 7.5.h),
            _FolderViewItemDate(dateTime: modifiedDateTime),
            _FolderViewItemName(itemName: itemName),
            _FolderViewItemButton.activeButton(
                textLocaleKey: LocaleKeys.folderView_openTheFile,
                buttonOnTap: openTheFileFunction
            )
          ]
      )
  );

  FolderViewItem.unknownError({
    Key? key,
    required FutureVoidFunction onButtonTap,
    required String itemName,
    required DateTime? modifiedDateTime
  }) : super(
      key: key,
      ignoring: false,
      child: _folderViewItemFrame(
          financeItemIcon: _FolderViewItemIcon.error(),
          children: [
            SizedBox(height: 7.5.h),
            _FolderViewItemDate(dateTime: modifiedDateTime),
            _FolderViewItemName(itemName: itemName),
            _FolderViewItemButton.activeButton(
                textLocaleKey: LocaleKeys.folderView_tryDownload,
                buttonOnTap: onButtonTap
            )
          ]
      )
  );
}

Container _folderViewItemFrame({
  required _FolderViewItemIcon financeItemIcon,
  required List<Widget> children
})=>Container(
  height: _FolderViewItemSizes.instance.folderViewItemHeight,
  margin: _FolderViewItemVariables.instance.folderViewItemMargin,
  decoration: BoxDecoration(
      color: ColorConstants.instance.blank,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.r),
          bottomRight: Radius.circular(8.r),
          topRight: Radius.circular(8.r)
      )
  ),
  child: Row(
    children: [
      financeItemIcon,
      Expanded(
        child: Padding(
          padding: _FolderViewItemVariables.instance.folderViewItemItemPadding,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          ),
        ),
      )
    ],
  ),
);
