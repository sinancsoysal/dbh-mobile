import 'dart:async';

import '../../../data/models/dtos/remote/dbh_api/topics/activity_log/activity_log_with_detail_dto.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_with_detail_dto.dart';
import '../../../domain/usecases/remote/dbh_api/topics/activity_log/activity_log_get_logs_with_details.dart';
import 'activity_log_bloc.dart';
import 'package:intl/intl.dart';

import '../../../core/params/remote/dbh_api/topics/activity_log/activity_params_get_latest_logs.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../core/utils/extensions/string/string_to_token_extension.dart';
import '../../../data/data_sources/local/preferences_manager.dart';
import '../../widgets/template_components/custom_snackbar.dart';
import 'package:flutter/material.dart';

class BlocRepositoryOfActivityLog {
  final ActivityLogGetLogWithDetailssUseCase
      _activityLogGetLogsWithDetailsUseCase;
  final StreamController<FetchingStatus> _controller =
      StreamController<FetchingStatus>();
  final BuildContext _context;
  List<ActivityLogWithDetailDto>? activityLogs = [];
  List<ActivityLogWithDetailDto>? queriedActivityLogs = [];
  bool sortDesc = true;

  BlocRepositoryOfActivityLog(
      BuildContext context, this._activityLogGetLogsWithDetailsUseCase)
      : _context = context;

  Stream<FetchingStatus> get status async* {
    yield* _controller.stream;
  }

  String? get getCachedToken =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.token);

  void getLatestLogs() async {
    _controller.add(FetchingStatus.loading);
    final DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?
        getLatestLogsUseCaseResult =
        await _activityLogGetLogsWithDetailsUseCase(
      params:
          ActivityLogParamsGetLatestLogs(bearerToken: getCachedToken!.tokenize),
    );
    if (getLatestLogsUseCaseResult is OperationSuccess) {
      if (getLatestLogsUseCaseResult?.value?.data != null) {
        activityLogs = getLatestLogsUseCaseResult!.value!.data;
        queriedActivityLogs = activityLogs;
      }
      _controller.add(FetchingStatus.loaded);
    } else {
      // TODO: Implement refresh token
      if (getLatestLogsUseCaseResult?.error?.response?.statusCode == 401) {
        CustomSnackBar(
                _context, "Oturum süreniz doldu\nLütfen tekrar Giriş yapınız")
            .show;
      }
      _controller.add(FetchingStatus.failed);
    }
  }

  void dispose() => _controller.close();

  void queryLogs(String value) {
    queriedActivityLogs = activityLogs
        ?.where(
          (element) => ((element.userName.toString().toLowerCase().contains(
                    value.toLowerCase(),
                  )) ||
              element.operation.toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              element.createdDate.toString().toLowerCase().contains(
                    value.toLowerCase(),
                  )),
        )
        .toList();
  }

  void sort(ActivitySort value) {
    DateFormat format = DateFormat("MM/dd/yyyy");
    sortDesc = !sortDesc;
    switch (value) {
      case ActivitySort.date:
        activityLogs!.sort(
          (a, b) {
            return format
                .parse(sortDesc ? b.createdDate! : a.createdDate!)
                .compareTo(
                  format.parse(sortDesc ? a.createdDate! : b.createdDate!),
                );
          },
        );
        if (activityLogs != null) {
          queriedActivityLogs = activityLogs;
        }

        break;
      case ActivitySort.admin:
        queriedActivityLogs = activityLogs
            ?.where(
              (element) => element.userRole
                  .toString()
                  .toLowerCase()
                  .contains("administrator"),
            )
            .toList();
        break;
      case ActivitySort.user:
        queriedActivityLogs = activityLogs
            ?.where(
              (element) =>
                  element.userRole.toString().toLowerCase().contains("user"),
            )
            .toList();
        break;
      case ActivitySort.manager:
        queriedActivityLogs = activityLogs
            ?.where(
              (element) =>
                  element.userRole.toString().toLowerCase().contains("manager"),
            )
            .toList();
        break;
    }
  }
}
