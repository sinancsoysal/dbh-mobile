import 'dart:async';

import '../../../../core/utils/constants/locale_keys.g.dart';

import '../../../../config/routes/navigation_routes.dart';
import '../../../../config/routes/navigation_service.dart';
import '../../../../core/params/remote/dbh_api/topics/area/area_params_get_all.dart';
import '../../../../core/utils/enums/fetching_status_enum.dart';
import '../../../../core/utils/extensions/string/string_to_token_extension.dart';
import '../../../../data/data_sources/local/preferences_manager.dart';
import '../../../../data/models/dtos/remote/dbh_api/topics/area/area_dto.dart';
import '../../../../domain/usecases/remote/dbh_api/topics/area/area_use_case_get_all.dart';
import '../../../widgets/template_components/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';

class AppSelectionAndLocationMergedRepository {
  final StreamController<FetchingStatus> _controller =
      StreamController<FetchingStatus>();
  final AreaGetaAllUseCase _areaGetaAllUseCase;
  final BuildContext _context;

  List<AreaDto>? areas = [];
  AreaDto? selectedArea;
  TextEditingController areaSearchFieldController = TextEditingController();

  AppSelectionAndLocationMergedRepository(
      BuildContext context, this._areaGetaAllUseCase)
      : _context = context;

  Stream<FetchingStatus> get status async* {
    yield* _controller.stream;
  }

  String? get getCachedToken =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.token);

  Future<void> getCities() async {
    if (areas?.isNotEmpty ?? false) {
      return;
    } else {
      _controller.add(FetchingStatus.loading);

      await _areaGetaAllUseCase(
        params: AreaParamsGetAll(bearerToken: getCachedToken!.tokenize),
        onAuthorizationFail: () {
          CustomSnackBar(
                  _context, "Oturum süreniz doldu\nLütfen tekrar Giriş yapınız")
              .show;
          _controller.add(FetchingStatus.failed);
        },
        onfail: (error) {
          CustomSnackBar(_context, " Error").show;
          _controller.add(FetchingStatus.failed);
          // Show Snackbar
        },
        onSuccess: (result) {
          areas = result?.value?.data;
          _controller.add(FetchingStatus.loaded);
        },
      );
    }
  }

  void updateSelectedArea({AreaDto? area}) {
    areaSearchFieldController.value =
        areaSearchFieldController.value.copyWith(text: area?.title ?? "");
    selectedArea = area;
  }

  void dispose() => _controller.close();

  void proceed(String? path) {

    if(path!=null&&path==NavigationConstants.financeView){
      PreferencesManager.instance.setStringValue(PreferencesKeys.xarea, "");
      PreferencesManager.instance.setStringValue(PreferencesKeys.xareaName, "");
      PreferencesManager.instance.setStringValue(PreferencesKeys.selectedApplicationRoute, path);
      NavigationService.instance.navigateToPage(path: path, data: selectedArea);
    }else{
      if (selectedArea?.id != null) {
        PreferencesManager.instance.setStringValue(PreferencesKeys.xarea, selectedArea!.id);

        PreferencesManager.instance.setStringValue(PreferencesKeys.xareaName,
            selectedArea!.title ?? LocaleKeys.homeCostControl_unknown);

        //ToDo: check this line, with below lines, we can update the slide driwer options.
        PreferencesManager.instance.setStringValue(
            PreferencesKeys.selectedApplicationRoute,
            path??NavigationConstants.homeCostControlView
        );

        NavigationService.instance.navigateToPage(
          path: path??NavigationConstants.homeCostControlView,
          data: selectedArea,
        );
      }
    }

  }
}
