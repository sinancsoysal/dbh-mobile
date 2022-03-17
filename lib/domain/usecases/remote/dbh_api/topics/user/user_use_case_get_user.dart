import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_get_user.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/user/api_result_of_user_dto.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserGetUserUseCase
    implements UseCase<DataState<ApiResultOfUserDto>?, UserParamsGetUser> {
  final UserRepository _userRepository;

  UserGetUserUseCase(this._userRepository);

  @override
  Future<DataState<ApiResultOfUserDto>?> call(
          {required UserParamsGetUser params}) =>
      _userRepository.getUser(params: params);
}
