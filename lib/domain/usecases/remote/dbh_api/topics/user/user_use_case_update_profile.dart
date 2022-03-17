import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_update_profile.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserUpdateProfileUseCase
    implements
        UseCaseWithOperators<DataState<ApiResult>?, UserParamsUpdateProfile> {
  final UserRepository _userRepository;

  UserUpdateProfileUseCase(this._userRepository);

  @override
  Future<DataState<ApiResult>?> call({
    required UserParamsUpdateProfile params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  }) =>
      _userRepository.updateProfile(
        params: params,
        onSuccess: onSuccess,
        onfail: onfail,
        onAuthorizationFail: onAuthorizationFail,
      );
}
