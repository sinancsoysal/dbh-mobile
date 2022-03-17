import '../../../../../../data/models/dtos/remote/dbh_api/topics/settings/create_role_dto.dart';

class SettingsParamsCreateRole {
  final String bearerToken;
  final CreateRoleDto createRoleDto;
  SettingsParamsCreateRole({
    required this.bearerToken,
    required this.createRoleDto,
  });
}
