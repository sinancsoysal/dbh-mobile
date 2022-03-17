import '../../../../../../core/params/remote/dbh_api/topics/activity_log/activity_params_log_get_by_user.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_dto.dart';
import '../../../../../repositories/remote/dbh_api/topics/activity_log/activity_log_repository.dart';

class ActivityLogGetByUser
    implements
        UseCase<DataState<ApiResultOfEnumerableOfActivityLogDto>?,
            ActivityLogParamsGetByUser> {
  final ActivityLogRepository _activityLogRepository;

  ActivityLogGetByUser(this._activityLogRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfActivityLogDto>?> call(
          {required ActivityLogParamsGetByUser params}) =>
      _activityLogRepository.getByUser(params: params);
}
