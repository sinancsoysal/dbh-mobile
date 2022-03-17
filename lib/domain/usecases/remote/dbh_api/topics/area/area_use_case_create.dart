import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_create.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/area/area_repository.dart';

class AreaCreateUseCase
    implements UseCase<DataState<ApiResult>?, AreaParamsCreate> {
  final AreaRepository _areaRepository;

  AreaCreateUseCase(this._areaRepository);

  @override
  Future<DataState<ApiResult>?> call({required AreaParamsCreate params}) =>
      _areaRepository.create(params: params);
}
