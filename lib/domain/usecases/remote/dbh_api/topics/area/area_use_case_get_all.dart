import '../../../../../repositories/remote/dbh_api/topics/area/area_repository.dart';

import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_get_all.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/area/api_result_of_enumerable_of_area_dto.dart';

class AreaGetaAllUseCase
    implements
        UseCaseWithOperators<DataState<ApiResultOfEnumerableOfAreaDto>?,
            AreaParamsGetAll> {
  final AreaRepository _areaRepository;

  AreaGetaAllUseCase(this._areaRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfAreaDto>?> call({
    required AreaParamsGetAll params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfAreaDto>?>?
        onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  }) =>
      _areaRepository.getAll(
        params: params,
        onAuthorizationFail: onAuthorizationFail,
        onSuccess: onSuccess,
        onfail: onfail,
      );
}
