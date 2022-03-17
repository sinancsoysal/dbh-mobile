import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_get_all_roles.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/settings/api_result_of_enumerable_of_role_claim_dto.dart';
import '../../../../../repositories/remote/dbh_api/topics/settings/settings_repository.dart';

class SettingsGetAllRolesUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfRoleClaimDto>,
            SettingsParamsGetAllRoles> {
  final SettingsRepository _settingsRepository;

  SettingsGetAllRolesUseCase(this._settingsRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfRoleClaimDto>> call(
          {required SettingsParamsGetAllRoles params}) =>
      _settingsRepository.getAllRoles(params: params);
}
