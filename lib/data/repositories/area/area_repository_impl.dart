import '../../../config/network/network_operator.dart';
import '../../../core/resources/use_case.dart';
import '../../data_sources/remote/dbh_api/topics/area/area_service.dart';
import '../../models/models/remote/dbh_api/topics/area/api_result_of_enumerable_of_area_dto.dart';
import '../../models/models/remote/dbh_api/topics/area/api_result_of_area.dart';
import '../../models/models/api_result.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/params/remote/dbh_api/topics/area/area_params_update.dart';
import '../../../core/params/remote/dbh_api/topics/area/area_params_get_by_id.dart';
import '../../../core/params/remote/dbh_api/topics/area/area_params_get_all.dart';
import '../../../core/params/remote/dbh_api/topics/area/area_params_delete.dart';
import '../../../core/params/remote/dbh_api/topics/area/area_params_create.dart';
import '../../../domain/repositories/remote/dbh_api/topics/area/area_repository.dart';

class AreaRepositoryImpl implements AreaRepository {
  final AreaService _areaService;

  AreaRepositoryImpl(this._areaService);
  @override
  Future<DataState<ApiResult>?> create({required AreaParamsCreate params}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>?> delete({required AreaParamsDelete params}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResultOfArea>?> getById(
      {required AreaParamsGetById params}) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>?> update({required AreaParamsUpdate params}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfAreaDto>?> getAll({
    required AreaParamsGetAll params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfAreaDto>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) async {
    return await NetworkOperator<ApiResultOfEnumerableOfAreaDto>(
      requestFunction: _areaService.getAll(bearerToken: params.bearerToken),
      onSuccess: onSuccess,
      onFail: onfail,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }
}
