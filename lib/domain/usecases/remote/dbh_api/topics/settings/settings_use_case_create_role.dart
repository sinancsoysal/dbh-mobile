import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_create_role.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/settings/settings_repository.dart';

class SettingsCreateRoleUseCase
    implements UseCase<DataState<ApiResult>, SettingsParamsCreateRole> {
  final SettingsRepository _settingsRepository;

  SettingsCreateRoleUseCase(this._settingsRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required SettingsParamsCreateRole params}) =>
      _settingsRepository.createRole(params: params);
}
