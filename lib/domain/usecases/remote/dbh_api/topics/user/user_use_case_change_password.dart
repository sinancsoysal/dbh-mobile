import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_change_password.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';

class UserChangePasswordUseCase
    implements
        UseCaseWithOperators<DataState<ApiResult>?, UserParamsChangePassword> {
  final UserRepository _userRepository;

  UserChangePasswordUseCase(this._userRepository);

  @override
  Future<DataState<ApiResult>?> call({
    required UserParamsChangePassword params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  }) =>
      _userRepository.changePassword(
        params: params,
        onAuthorizationFail: onAuthorizationFail,
        onSuccess: onSuccess,
        onfail: onfail,
      );
}
