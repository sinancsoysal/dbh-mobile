import '../../../../../../data/models/dtos/remote/dbh_api/topics/user/change_password_dto.dart';

class UserParamsChangePassword {
  final String bearerToken;
  final ChangePasswordDto changePasswordDto;
  UserParamsChangePassword({
    required this.bearerToken,
    required this.changePasswordDto,
  });
}
