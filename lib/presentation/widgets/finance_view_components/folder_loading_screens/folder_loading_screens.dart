import 'package:mobile/presentation/widgets/common/font_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/utils/constants/locale_keys.g.dart';

part 'variables/folder_loading_screens_sizes.dart';
part 'variables/folder_loading_screens_variables.dart';

part 'components/folder_circular_progress_indicator.dart';
part 'components/folder_circular_progress_indicator_text.dart';

class FolderLoadingScreens extends Container{

  FolderLoadingScreens.fmLoginManagerInitializing({
    Key? key,
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderLoadingScreen(
          textLocaleKey: LocaleKeys.folderView_loadingScreen_fileManagerInitializing
      )
  );

  FolderLoadingScreens.fmLoginCredentialsRequesting({
    Key? key,
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderLoadingScreen(
          textLocaleKey: LocaleKeys.folderView_loadingScreen_loginCredentialsRequesting
      )
  );

  FolderLoadingScreens.fmLoginRequestSending({
    Key? key,
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderLoadingScreen(
          textLocaleKey: LocaleKeys.folderView_loadingScreen_loginRequestSending
      )
  );

  FolderLoadingScreens.fmFolderManagerInitializing({
    Key? key,
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderLoadingScreen(
          textLocaleKey: LocaleKeys.folderView_loadingScreen_folderManagerInitializing
      )
  );

  FolderLoadingScreens.fmFolderDetailsFetching({
    Key? key,
  }) : super(
      key: key,
      width: double.infinity,
      height: double.infinity,
      child: _folderLoadingScreen(
          textLocaleKey: LocaleKeys.folderView_loadingScreen_folderDetailsFetching
      )
  );
}


Column _folderLoadingScreen({
  required String textLocaleKey
})=>Column(
  mainAxisSize: MainAxisSize.max,
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Spacer(),
    _FolderCircularProgressIndicator(),
    SizedBox(
        height: _FolderLoadingScreensSizes
        .instance
        .folderLoadingScreenProgressIndicatorSpacerHeight
    ),
    _FolderCircularProgressIndicatorText(textLocaleKey: textLocaleKey),
    const Spacer(flex: 3),
  ],
);

