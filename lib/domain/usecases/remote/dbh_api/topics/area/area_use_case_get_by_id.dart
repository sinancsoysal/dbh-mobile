import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_get_by_id.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/area/api_result_of_area.dart';
import '../../../../../repositories/remote/dbh_api/topics/area/area_repository.dart';

class AreaGetByIdUseCase
    implements UseCase<DataState<ApiResultOfArea>?, AreaParamsGetById> {
  final AreaRepository _areaRepository;

  AreaGetByIdUseCase(this._areaRepository);

  @override
  Future<DataState<ApiResultOfArea>?> call(
          {required AreaParamsGetById params}) =>
      _areaRepository.getById(params: params);
}
