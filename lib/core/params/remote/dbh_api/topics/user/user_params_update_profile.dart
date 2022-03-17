import '../../../../../../data/models/dtos/remote/dbh_api/topics/user/update_profile_dto.dart';

class UserParamsUpdateProfile {
  final String berarerToken;
  final UpdateProfileDto updateProfileDto;
  UserParamsUpdateProfile({
    required this.berarerToken,
    required this.updateProfileDto,
  });
}
