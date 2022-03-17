import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_create_role.dart';
import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_delete_role.dart';
import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_get_all_members.dart';
import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_get_all_roles.dart';
import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_suspend_user.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/settings/api_result_of_enumerable_of_role_claim_dto.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/settings/api_result_of_enumerable_of_user_dto.dart';

abstract class SettingsRepository {
  Future<DataState<ApiResult>> createRole({SettingsParamsCreateRole params});
  Future<DataState<ApiResult>> deleteRole({SettingsParamsDeleteRole params});
  Future<DataState<ApiResultOfEnumerableOfRoleClaimDto>> getAllRoles(
      {SettingsParamsGetAllRoles params});
  Future<DataState<ApiResultOfEnumerableOfUserDto>> getAllMembers(
      {SettingsParamsGetAllMembers params});
  Future<DataState<ApiResult>> suspendUser({SettingsParamsSuspendUser params});
}
