import '../../../../../../core/params/remote/dbh_api/topics/settings/settings_params_get_all_members.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/settings/api_result_of_enumerable_of_user_dto.dart';
import '../../../../../repositories/remote/dbh_api/topics/settings/settings_repository.dart';

class SettingsGetAllMembersUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfUserDto>,
            SettingsParamsGetAllMembers> {
  final SettingsRepository _settingsRepository;

  SettingsGetAllMembersUseCase(this._settingsRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfUserDto>> call(
          {required SettingsParamsGetAllMembers params}) =>
      _settingsRepository.getAllMembers(params: params);
}
