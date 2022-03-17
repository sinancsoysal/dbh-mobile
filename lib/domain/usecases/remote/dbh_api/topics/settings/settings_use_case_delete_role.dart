import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_delete_role.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/settings/settings_repository.dart';

class SettingsDeleteRoleUseCase
    implements UseCase<DataState<ApiResult>, SettingsParamsDeleteRole> {
  final SettingsRepository _settingsRepository;

  SettingsDeleteRoleUseCase(this._settingsRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required SettingsParamsDeleteRole params}) =>
      _settingsRepository.deleteRole(params: params);
}
