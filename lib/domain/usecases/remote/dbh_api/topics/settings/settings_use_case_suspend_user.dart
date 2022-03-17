import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_suspend_user.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/settings/settings_repository.dart';

class SettingsSuspendUserUseCase
    implements UseCase<DataState<ApiResult>, SettingsParamsSuspendUser> {
  final SettingsRepository _settingsRepository;

  SettingsSuspendUserUseCase(this._settingsRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required SettingsParamsSuspendUser params}) =>
      _settingsRepository.suspendUser(params: params);
}
