import 'dart:async' show FutureOr;

import 'package:mobile/core/utils/constants/color_constants.dart';
import 'package:mobile/core/utils/constants/image_constants.dart';
import 'package:mobile/presentation/widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/utils/constants/locale_keys.g.dart';

part 'variables/folder_error_screens_sizes.dart';
part 'variables/folder_error_screens_variables.dart';

part 'components/folder_error_icon.dart';
part 'components/folder_error_title.dart';
part 'components/folder_error_description.dart';
part 'components/folder_error_button.dart';

class FolderErrorScreens extends Container {
  FolderErrorScreens.fmLoginCredentialsCouldNotFetch({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
    key: key,
    width: double.infinity,
    height: double.infinity,
    child: _folderErrorScreen(
        iconPath: ImageConstants.instance.folderViewLockIcon,
        titleLocaleKey: LocaleKeys.folderView_errorScreen_loginCredentialsCouldNotFetch,
        descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotFetchFileManagerCredentials,
        buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_fetchCredentials,
        isButtonLoading: isButtonLoading,
        buttonOnTap: buttonOnTap
    )
  );

  FolderErrorScreens.fmLoginCookieCouldNotFetch({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderErrorScreen(
          iconPath: ImageConstants.instance.folderViewLockIcon,
          titleLocaleKey: LocaleKeys.folderView_errorScreen_fileManagerCookiesCouldNotFetch,
          descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotFetchTheFileManagerCookies,
          buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_fetchCookies,
          isButtonLoading: isButtonLoading,
          buttonOnTap: buttonOnTap
      )
  );

  FolderErrorScreens.fmFolderCouldNotFetchDueUnknownReason({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderErrorScreen(
          iconPath: ImageConstants.instance.folderViewLockIcon,
          titleLocaleKey: LocaleKeys.folderView_errorScreen_folderCouldNotLoadDueUnknownReasons,
          descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotLoadTheFolder,
          buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_loadTheFolder,
          isButtonLoading: isButtonLoading,
          buttonOnTap: buttonOnTap
      )
  );

  FolderErrorScreens.fmFolderCouldNotFetchDueAuthToken({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderErrorScreen(
          iconPath: ImageConstants.instance.folderViewStopHandIcon,
          titleLocaleKey: LocaleKeys.folderView_errorScreen_folderCouldNotLoadDueAuthTokenError,
          descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotLoadTheFolderDueAuthKey,
          buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_tryItAgain,
          isButtonLoading: isButtonLoading,
          buttonOnTap: buttonOnTap
      )
  );

  FolderErrorScreens.fmFolderNotFound({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderErrorScreen(
          iconPath: ImageConstants.instance.folderViewQuestionMarkIcon,
          titleLocaleKey: LocaleKeys.folderView_errorScreen_folderDeletedOrMissing,
          descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotFoundTheFolder,
          buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_previousFolder,
          isButtonLoading: isButtonLoading,
          buttonOnTap: buttonOnTap
      )
  );

  FolderErrorScreens.fmFolderUnauthorized({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderErrorScreen(
          iconPath: ImageConstants.instance.folderViewEyeWithCrossIcon,
          titleLocaleKey: LocaleKeys.folderView_errorScreen_folderPermissionsRequired,
          descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotLoadTheFolderDueFolderPermissions,
          buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_previousFolder,
          isButtonLoading: isButtonLoading,
          buttonOnTap: buttonOnTap
      )
  );

  FolderErrorScreens.fmDownloadErrorDueAuthentication({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderErrorScreen(
          iconPath: ImageConstants.instance.folderViewLockIcon,
          titleLocaleKey: LocaleKeys.folderView_errorScreen_fileManagerAuthenticationKeyError,
          descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotDownloadTheFileDueAuthenticationKeyError,
          buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_reLogin,
          isButtonLoading: isButtonLoading,
          buttonOnTap: buttonOnTap
      )
  );

  FolderErrorScreens.fmDownloadErrorFileNotFound({
    Key? key,
    bool isButtonLoading=false,
    required FutureOr<void> Function() buttonOnTap
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderErrorScreen(
          iconPath: ImageConstants.instance.folderViewTelescopeIcon,
          titleLocaleKey: LocaleKeys.folderView_errorScreen_fileDeletedOrMissing,
          descriptionLocaleKey:  LocaleKeys.folderView_errorScreen_itLooksLikeWeCouldNotFoundTheFile,
          buttonTextLocaleKey: LocaleKeys.folderView_errorScreen_refreshTheFolder,
          isButtonLoading: isButtonLoading,
          buttonOnTap: buttonOnTap
      )
  );
}

Column _folderErrorScreen({
  required String iconPath,
  required String titleLocaleKey,
  required String descriptionLocaleKey,
  required String buttonTextLocaleKey,
  required bool isButtonLoading,
  required FutureOr<void> Function() buttonOnTap
})=>Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Spacer(),
    _FolderErrorIcon(iconAssetPath: iconPath),
    SizedBox(height: _FolderErrorScreensSizes.instance.folderErrorScreenIconSpacer),
    _FolderErrorTitle(titleLocaleKey: titleLocaleKey),
    SizedBox(height: _FolderErrorScreensSizes.instance.folderErrorScreenTitleDescriptionSpacer),
    _FolderErrorDescription(descriptionLocaleKey: descriptionLocaleKey),
    SizedBox(height: _FolderErrorScreensSizes.instance.folderErrorScreenButtonSpacer),
    if(isButtonLoading) _FolderErrorButton.loading(onTap: buttonOnTap)
    else _FolderErrorButton(
        buttonTextLocaleKey: buttonTextLocaleKey,
        onTap: buttonOnTap
    ),
    const Spacer(flex: 3),
  ],
);
