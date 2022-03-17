import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_delete.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/area/area_repository.dart';

class AreaDeleteUseCase
    implements UseCase<DataState<ApiResult>?, AreaParamsDelete> {
  final AreaRepository _areaRepository;

  AreaDeleteUseCase(this._areaRepository);

  @override
  Future<DataState<ApiResult>?> call({required AreaParamsDelete params}) =>
      _areaRepository.delete(params: params);
}
