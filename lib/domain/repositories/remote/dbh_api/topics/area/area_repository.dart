import '../../../../../../core/resources/use_case.dart';

import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_create.dart';
import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_delete.dart';
import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_get_all.dart';
import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_get_by_id.dart';
import '../../../../../../core/params/remote/dbh_api/topics/area/area_params_update.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/area/api_result_of_area.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/area/api_result_of_enumerable_of_area_dto.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';

abstract class AreaRepository {
  Future<DataState<ApiResult>?> create({required AreaParamsCreate params});
  Future<DataState<ApiResult>?> update({required AreaParamsUpdate params});
  Future<DataState<ApiResult>?> delete({required AreaParamsDelete params});
  Future<DataState<ApiResultOfArea>?> getById(
      {required AreaParamsGetById params});
  Future<DataState<ApiResultOfEnumerableOfAreaDto>?> getAll({
    required AreaParamsGetAll params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfAreaDto>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
}
