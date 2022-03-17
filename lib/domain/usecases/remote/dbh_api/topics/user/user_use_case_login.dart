import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_login.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/user/auth_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserLoginUseCase
    implements UseCase<DataState<AuthResult>?, UserParamsLogin> {
  final UserRepository _userRepository;

  UserLoginUseCase(this._userRepository);

  @override
  Future<DataState<AuthResult>?> call({required UserParamsLogin params}) =>
      _userRepository.login(params: params);
}
