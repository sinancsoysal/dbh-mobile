import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_refresh_token.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/user/auth_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserRefreshTokenUseCase
    implements UseCase<DataState<AuthResult>?, UserParamsRefreshToken> {
  final UserRepository _userRepository;

  UserRefreshTokenUseCase(this._userRepository);

  @override
  Future<DataState<AuthResult>?> call(
          {required UserParamsRefreshToken params}) =>
      _userRepository.refreshToken(params: params);
}
