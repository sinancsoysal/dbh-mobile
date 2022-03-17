import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/dtos/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_with_detail_dto.dart';

import '../../../../../../core/params/remote/dbh_api/topics/activity_log/activity_params_get_latest_logs.dart';

import '../../../../../../core/params/remote/dbh_api/topics/activity_log/activity_params_log_get_by_user.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_dto.dart';

abstract class ActivityLogRepository {
  Future<DataState<ApiResultOfEnumerableOfActivityLogDto>?> getByUser(
      {required ActivityLogParamsGetByUser params});

  Future<DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>
      getLatestLogs({
    required ActivityLogParamsGetLatestLogs params,
    ConditionValueOperator<
            DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>
      getLogsWithDetails({
    required ActivityLogParamsGetLatestLogs params,
    ConditionValueOperator<
            DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
}
