import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_register_user.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserRegisterUseCase
    implements UseCase<DataState<ApiResult>?, UserParamsRegisterUser> {
  final UserRepository _userRepository;

  UserRegisterUseCase(this._userRepository);

  @override
  Future<DataState<ApiResult>?> call(
          {required UserParamsRegisterUser params}) =>
      _userRepository.registerUser(params: params);
}
