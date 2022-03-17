import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_update.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/area/area_repository.dart';

class AreaUpdateUseCase
    implements UseCase<DataState<ApiResult>?, AreaParamsUpdate> {
  final AreaRepository _areaRepository;

  AreaUpdateUseCase(this._areaRepository);

  @override
  Future<DataState<ApiResult>?> call({required AreaParamsUpdate params}) =>
      _areaRepository.update(params: params);
}
