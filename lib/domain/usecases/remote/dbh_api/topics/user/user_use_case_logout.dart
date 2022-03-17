import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_logout.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserLogoutUseCase
    implements UseCase<DataState<ApiResult>?, UserParamsLogout> {
  final UserRepository _userRepository;

  UserLogoutUseCase(this._userRepository);

  @override
  Future<DataState<ApiResult>?> call({required UserParamsLogout params}) =>
      _userRepository.logout(params: params);
}
