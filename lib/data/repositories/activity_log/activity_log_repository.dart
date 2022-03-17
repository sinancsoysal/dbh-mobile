import '../../../core/resources/use_case.dart';
import '../../models/dtos/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_with_detail_dto.dart';

import '../../../config/network/network_operator.dart';
import '../../data_sources/remote/dbh_api/topics/activity_log/activity_log_service.dart';
import '../../models/models/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_dto.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/params/remote/dbh_api/topics/activity_log/activity_params_log_get_by_user.dart';
import '../../../core/params/remote/dbh_api/topics/activity_log/activity_params_get_latest_logs.dart';
import '../../../domain/repositories/remote/dbh_api/topics/activity_log/activity_log_repository.dart';

class ActivityLogRepositoryImpl implements ActivityLogRepository {
  ActivityLogRepositoryImpl(this._activityLogService);

  final ActivityLogService _activityLogService;

  @override
  Future<DataState<ApiResultOfEnumerableOfActivityLogDto>?> getByUser(
      {required ActivityLogParamsGetByUser params}) async {
    return await NetworkOperator<ApiResultOfEnumerableOfActivityLogDto>(
            requestFunction:
                _activityLogService.getByUser(bearerToken: params.bearerToken),
            onFail: (error) {})
        .request();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>
      getLatestLogs({
    required ActivityLogParamsGetLatestLogs params,
    ConditionValueOperator<
            DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) async {
    return await NetworkOperator<
        ApiResultOfEnumerableOfActivityLogWithDetailDto>(
      requestFunction:
          _activityLogService.getLatestLogs(bearerToken: params.bearerToken),
      onSuccess: onSuccess,
      onFail: onfail,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>
      getLogsWithDetails(
          {required ActivityLogParamsGetLatestLogs params,
          ConditionValueOperator<
                  DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>?
              onSuccess,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<List<String>>? onfail}) async {
    return await NetworkOperator<
        ApiResultOfEnumerableOfActivityLogWithDetailDto>(
      requestFunction: _activityLogService.getLogsWithDetails(
          bearerToken: params.bearerToken),
      onSuccess: onSuccess,
      onFail: onfail,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }
}
