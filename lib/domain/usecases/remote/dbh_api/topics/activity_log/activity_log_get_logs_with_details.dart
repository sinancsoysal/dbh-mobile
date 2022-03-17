import '../../../../../../core/params/remote/dbh_api/topics/activity_log/activity_params_get_latest_logs.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/dtos/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_with_detail_dto.dart';
import '../../../../../repositories/remote/dbh_api/topics/activity_log/activity_log_repository.dart';

class ActivityLogGetLogWithDetailssUseCase
    implements
        UseCaseWithOperators<
            DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?,
            ActivityLogParamsGetLatestLogs> {
  final ActivityLogRepository _activityLogRepository;

  ActivityLogGetLogWithDetailssUseCase(this._activityLogRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?> call(
          {required ActivityLogParamsGetLatestLogs params,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<
                  DataState<ApiResultOfEnumerableOfActivityLogWithDetailDto>?>?
              onSuccess,
          ConditionValueOperator<List<String>>? onfail}) =>
      _activityLogRepository.getLogsWithDetails(
        params: params,
        onSuccess: onSuccess,
        onfail: onfail,
        onAuthorizationFail: onAuthorizationFail,
      );
}
