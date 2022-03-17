import 'dart:async' show Stream, StreamController, StreamSubscription, FutureOr;
import 'package:mobile/core/params/remote/dbh_api/topics/user/user_params_get_file_manager_login_details.dart';
import 'package:mobile/core/resources/data_state.dart';
import 'package:mobile/data/models/dtos/remote/dbh_api/topics/user/file_manager_login_dto.dart';
import 'package:mobile/data/models/models/remote/dbh_api/topics/user/api_result_of_file_manager_login_details.dart';
import 'package:mobile/domain/usecases/remote/dbh_api/topics/user/user_use_case_get_file_manager_login_details.dart';
import 'package:mobile/presentation/widgets/common/common_refresh_indicator.dart';
import 'package:mobile/presentation/widgets/finance_view_components/folder_view_result_screen/folder_view_result_screen.dart';
import 'package:open_file/open_file.dart';
import 'package:mobile/core/params/remote/fm_dbh_api/login/fm_login_params.dart';
import 'package:mobile/core/params/remote/fm_dbh_api/resources/fm_dbh_api_resources_params.dart';
import 'package:mobile/core/resources/local_storage_manager.dart';
import 'package:mobile/core/utils/constants/local_storage_constants.dart';
import 'package:mobile/core/utils/constants/route_constants/fm_dbh_api_route_constants.dart';
import 'package:mobile/core/utils/enums/fm_status_enums.dart';
import 'package:mobile/core/utils/extensions/file_extension/file_extension.dart';
import 'package:mobile/core/utils/extensions/folder_path/folder_path_extension.dart';
import 'package:mobile/core/utils/extensions/random_string_generator_extension/random_string_generator_extension.dart';
import 'package:mobile/data/data_sources/local/preferences_manager.dart';
import 'package:mobile/data/models/models/remote/fm_dbh_api/resources/fm_dbh_api_folder.dart';
import 'package:mobile/data/models/models/remote/fm_dbh_api/resources/fm_dbh_api_object.dart';
import 'package:mobile/domain/usecases/remote/fm_dbh_api/login/fm_user_use_case_login.dart';
import 'package:mobile/domain/usecases/remote/fm_dbh_api/resources/fm_dbh_api_resources_use_case.dart';
import 'package:mobile/injector.dart';
import 'package:mobile/presentation/widgets/finance_view_components/folder_error_screens/folder_error_screens.dart';
import 'package:mobile/presentation/widgets/finance_view_components/folder_loading_screens/folder_loading_screens.dart';
import 'package:mobile/presentation/widgets/finance_view_components/folder_view_folder_button/folder_view_folder_button.dart';
import 'package:mobile/presentation/widgets/finance_view_components/folder_view_item/folder_view_item.dart';
import 'package:mobile/presentation/widgets/finance_view_components/folder_view_navigation_buttons/folder_view_navigation_buttons.dart';
import 'package:mobile/presentation/widgets/finance_view_components/folder_view_sub_title/folder_view_sub_title.dart';
import 'package:mobile/presentation/widgets/template_components/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/presentation/widgets/template_components/header_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:retrofit/dio.dart' show HttpResponse;

import '../../../core/utils/constants/locale_keys.g.dart';
import 'package:mobile/presentation/widgets/common/custom_scaffold.dart';
import 'package:mobile/presentation/widgets/template_components/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

///Repositories
part '../bloc/bloc_repositories_of_folder/bloc_repository_of_file_downloader.dart';
part '../bloc/bloc_repositories_of_folder/bloc_repository_of_local_datas.dart';
part '../bloc/bloc_repositories_of_folder/bloc_repository_of_fm_login.dart';
part '../bloc/bloc_repositories_of_folder/bloc_repository_of_folder_operations.dart';

///Bloc Components
part '../bloc/folder_bloc.dart';
part '../bloc/folder_event.dart';
part '../bloc/folder_state.dart';

class FolderView extends StatefulWidget {
  const FolderView({Key? key}) : super(key: key);

  @override
  _FolderViewState createState() => _FolderViewState();
}

class _FolderViewState extends State<FolderView> {
  final GlobalKey<SliderMenuContainerState> _key = GlobalKey<SliderMenuContainerState>();

  @override
  Widget build(BuildContext context)=>MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) =>  const _BlocRepositoryOfLocalDatas()),
        RepositoryProvider(
            create: (context) =>  _BlocRepositoryOfFmLogin(
                context: context,
                fmUserUseCaseLogin: injector<FmUserUseCaseLogin>(),
                userGetFileManagerLoginDetailsUseCase: injector<UserGetFileManagerLoginDetailsUseCase>()
            )
        ),
        RepositoryProvider(
            create: (context) =>  _BlocRepositoryOfFolderOperations(
                context: context,
                fmDbhApiResourcesUseCase: injector<FmDbhApiResourcesUseCase>()
            )
        ),
        RepositoryProvider(
            create: (context) =>  _BlocRepositoryOfFileDownloader(
                context: context,
                dio: injector<Dio>(instanceName: "dioWithoutInterceptor")
            )
        ),
      ],
      child: BlocProvider(
          create: (context)=>FolderBloc(
              blocRepositoryOfLocalDatas: context.read<_BlocRepositoryOfLocalDatas>(),
              blocRepositoryOfFmLogin: context.read<_BlocRepositoryOfFmLogin>(),
              blocRepositoryOfFolderOperations: context.read<_BlocRepositoryOfFolderOperations>(),
              blocRepositoryOfFileDownloader: context.read<_BlocRepositoryOfFileDownloader>()
          )..add(const _FmLoginStartEvent()),
          child: Builder(
            builder: (context) => CustomScaffold(
              menuKey: _key,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buildHeader,
                    Expanded(
                      child: CommonRefreshIndicator(
                          onRefresh: ()async=>context.read<FolderBloc>().refreshCurrentFolder(),
                          child: _financeView(context),
                      ),
                    )
                  ]
              ),
            ),
          )
      )
  );


  Widget _financeView(BuildContext context)=>BlocBuilder<FolderBloc, _FolderState>(
      builder: (context, state){
        print("*"*10);
        print(state.fmLoginStatus);
        print(state.fmFolderFetchStatus);
        print(state.fmFileDownloadStatusEnum);
        if(state.fmLoginStatus==FmLoginStatusEnum.loginCredentialsCouldNotFetch){
          return FolderErrorScreens.fmLoginCredentialsCouldNotFetch(
              buttonOnTap: context.read<FolderBloc>().startFmLogin
          );
        }else if(state.fmLoginStatus==FmLoginStatusEnum.fmLoginCookieCouldNotFetch){
          return FolderErrorScreens.fmLoginCookieCouldNotFetch(
              buttonOnTap: context.read<FolderBloc>().startFmLogin
          );
        }else if(state.fmLoginStatus==FmLoginStatusEnum.initialState){
          return FolderLoadingScreens.fmLoginManagerInitializing();
        }else if(state.fmLoginStatus==FmLoginStatusEnum.loginCredentialsRequesting){
          return FolderLoadingScreens.fmLoginCredentialsRequesting();
        }else if(state.fmLoginStatus==FmLoginStatusEnum.fmLoginRequestSending){
          return FolderLoadingScreens.fmLoginRequestSending();
        }else if(state.fmFolderFetchStatus==FmFolderFetchStatusEnum.failedDueUnknownReason){
          return FolderErrorScreens.fmFolderCouldNotFetchDueUnknownReason(
              buttonOnTap: context.read<FolderBloc>().refreshCurrentFolder
          );
        }else if(state.fmFolderFetchStatus==FmFolderFetchStatusEnum.failedDueAuthTokenError){
          return FolderErrorScreens.fmFolderCouldNotFetchDueAuthToken(
              buttonOnTap: context.read<FolderBloc>().startFmLogin
          );
        }else if(state.fmFolderFetchStatus==FmFolderFetchStatusEnum.failedDueHttpResponseCode404){
          return FolderErrorScreens.fmFolderNotFound(
              buttonOnTap: context.read<FolderBloc>().navigateToPreviousFolder
          );
        }else if(state.fmFolderFetchStatus==FmFolderFetchStatusEnum.initialState){
          return FolderLoadingScreens.fmFolderManagerInitializing();
        }else if(state.fmFolderFetchStatus==FmFolderFetchStatusEnum.fetching){
          return FolderLoadingScreens.fmFolderDetailsFetching();
        }else if(state.fmFolderFetchStatus==FmFolderFetchStatusEnum.failedDueHttpResponseCode401){
          return FolderErrorScreens.fmFolderUnauthorized(
              buttonOnTap: context.read<FolderBloc>().navigateToPreviousFolder
          );
        }else if(state.fmFileDownloadStatusEnum==FmFileDownloadStatusEnum.failedDueAuthTokenError){
          return FolderErrorScreens.fmDownloadErrorDueAuthentication(
              buttonOnTap: context.read<FolderBloc>().startFmLogin
          );
        }else if(state.fmFileDownloadStatusEnum==FmFileDownloadStatusEnum.failedDueHttpResponseCode404){
          return FolderErrorScreens.fmDownloadErrorFileNotFound(
              buttonOnTap:  context.read<FolderBloc>().refreshCurrentFolder
          );
        }else{
          return _folderDetails(context, state);
        }
      }
  );

  Widget _folderDetails(BuildContext context, _FolderState state){
    final List<Widget> _children=[
      if(state.currentFolderPath=="/"||state.currentFolderPath=="") const FolderViewNavigationButtons.atRootFolder()
      else FolderViewNavigationButtons(
          currentFolderPath: state.currentFolderPath,
          rootFolderNavigatorFunction: context.read<FolderBloc>().navigateToRootFolder,
          previousFolderNavigatorFunction: context.read<FolderBloc>().navigateToPreviousFolder
      )
    ];

    final FmDbhApiFolder? _currentFolder=state.currentFolder;


    if(_currentFolder==null || (_currentFolder.items==null || _currentFolder.items!.isEmpty)){
      ///If current folder null or folder items null screens

      _children.add(
          Expanded(
            child: _buildFolderNullOrEmptyStates(
                context: context,
                state: state,
                currentFolder: _currentFolder
            ),
          )
      );

      return SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _children,
          )
      );
    }else{
      ///Current folder not null and items is not null and not
      final List<Widget> _folderButtons=_folderViewSubFolderWidgetList(
          context: context,
          currentFolder: _currentFolder,
          state: state
      );

      final List<Widget> _items=_folderViewItemsWidgetList(
          context: context,
          currentFolder: _currentFolder,
          state: state
      );

      if(_folderButtons.isNotEmpty){

        _children.add(
            FolderViewSubTitle(subTitle: LocaleKeys.folderView_folders.tr())
        );

        _children.add(
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 5.0.h, bottom: 10.0.h),
              physics: const BouncingScrollPhysics(),
              itemCount: _folderButtons.length,
              itemBuilder: (context, index) => _folderButtons[index],
            )
        );
      }

      if(_items.isNotEmpty){
        _children.add(
            FolderViewSubTitle(subTitle: LocaleKeys.folderView_items.tr())
        );

        _children.add(
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 15.0.h, bottom: 20.0.h),
                itemCount: _items.length,
                itemBuilder: (context, index)=>_items[index]
            )
        );
      }

      return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: _children,
          ),
        ),
      );
    }
  }

  Widget _buildFolderNullOrEmptyStates({
    required BuildContext context,
    required FmDbhApiFolder? currentFolder,
    required _FolderState state
  }){
    if(currentFolder==null){
      return FolderViewResultScreen.nullFolderScreen();
    }else{
      ///currentFolder.items!=null||currentFolder.items.isEmpty
      return FolderViewResultScreen.emptyItemListScreen();
    }
  }

  List<Widget> _folderViewSubFolderWidgetList({
    required BuildContext context,
    required FmDbhApiFolder currentFolder,
    required _FolderState state
  }){
    final List<FmDbhApiObject> _subFolders=[];
    if(currentFolder.items!=null&&currentFolder.items!.isNotEmpty){
      for (var element in currentFolder.items!) {
        if(element.isDir){
          _subFolders.add(element);
        }
      }
    }

    if(_subFolders.isNotEmpty){
      return List<Widget>.generate(
          _subFolders.length,
              (index)=>FolderViewFolderButton(
              folderName: _subFolders[index].name,
              onTap: ()async=>context
                  .read<FolderBloc>()
                  .navigateToFolderWithFolderPath(
                  _subFolders[index].path
              )
          )
      );
    }

    return const [];
  }

  List<Widget> _folderViewItemsWidgetList({
    required BuildContext context,
    required FmDbhApiFolder currentFolder,
    required _FolderState state
  }){
    final List<FmDbhApiObject> _files=[];
    if(currentFolder.items!=null&&currentFolder.items!.isNotEmpty){
      for (var element in currentFolder.items!) {
        if(!element.isDir){
          _files.add(element);
        }
      }
    }

    if(_files.isNotEmpty){
      return List<FolderViewItem>.generate(
          _files.length,
              (index)=>_buildFolderViewItemWithFileObject(
              context: context,
              file: _files[index],
              state: state
          )
      );
    }

    return const [];
  }

  FolderViewItem _buildFolderViewItemWithFileObject({
    required BuildContext context,
    required FmDbhApiObject file,
    required _FolderState state
  }) {
    final String _tempFileNameWithoutExtension=file
        .name
        .fileNameWithoutExtension(
        fileExtension: file.extension
    )??"";


    final bool isFileOnDownloadProcess=state.lastDownloadedFileName==_tempFileNameWithoutExtension
        && state.lastDownloadedFileExtension==file.extension;

    if(isFileOnDownloadProcess){
      final bool isFileDownloading=state.fmFileDownloadStatusEnum==FmFileDownloadStatusEnum.fileDownloading;

      final bool isFileDownloaded=state.fmFileDownloadStatusEnum==FmFileDownloadStatusEnum.fileDownloadCompleted;

      if(isFileDownloading){
        return FolderViewItem.downloading(
            itemName: _tempFileNameWithoutExtension,
            modifiedDateTime: DateTime.tryParse(file.modified),
            currentStep: state.downloadIndicatorPercent,
            totalStep: 100
        );
      }else if(isFileDownloaded){
        return FolderViewItem.downloaded(
            openTheFileFunction: ()async=>context.read<FolderBloc>().openFolder(
                context: context,
                fileName: _tempFileNameWithoutExtension,
                fileExtension: file.extension
            ),
            itemName: _tempFileNameWithoutExtension,
            modifiedDateTime: DateTime.tryParse(file.modified),
            currentStep: 100,
            totalStep: 100
        );
      }else{
        ///DownloadFailedStates But Just unknown error here (maybe connection gone etc.)
        ///so we don't need to refresh our auth token yet but if any error occours, we must navigate
        ///to user, more topper folder. So;
        ///For this reason;
        ///[FmFileDownloadStatusEnum.failedDueHttpResponseCode401]
        ///[FmFileDownloadStatusEnum.failedDueHttpResponseCode404]
        ///[FmFileDownloadStatusEnum.failedDueAuthTokenError]
        ///states will manage on build() function in this file.

        return FolderViewItem.unknownError(
            onButtonTap: ()async=> context.read<FolderBloc>().startToDownloadAFile(
                fileName: _tempFileNameWithoutExtension,
                fileExtension: file.extension,
                fileFullPath: file.path
            ),
            itemName: _tempFileNameWithoutExtension,
            modifiedDateTime: DateTime.tryParse(file.modified)
        );
      }

    }else{
      ///FileIsNotOnAnyDownloadProcess.
      return FolderViewItem(
        onButtonTap: ()async=> context.read<FolderBloc>().startToDownloadAFile(
            fileName: _tempFileNameWithoutExtension,
            fileExtension: file.extension,
            fileFullPath: file.path
        ),
        itemName: _tempFileNameWithoutExtension,
        extension: file.extension,
        modifiedDateTime: DateTime.tryParse(file.modified),
      );
    }
  }

  HeaderContent get buildHeader=> HeaderContent(
    enableNotchPadding: true,
    child: Column(
      children: [
        CustomAppBar(
          sliderKey: _key,
          title: LocaleKeys.folderView_folders,
          translateSubTitle: false,

        )
      ],
    ),
  );
}
