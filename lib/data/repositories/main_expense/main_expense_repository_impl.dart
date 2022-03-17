import '../../../config/network/network_operator.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_update.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_most_used.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_comparison.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_by_id.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_all_by_skip_offset.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_all.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_delete.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_create.dart';
import '../../../core/resources/use_case.dart';
import '../../data_sources/remote/dbh_api/topics/main_expense/main_expense_service.dart';
import '../../models/models/api_result.dart';
import '../../models/dtos/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_most_used_dto.dart';
import '../../models/models/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_comparison.dart';
import '../../../domain/repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseRepositoryImpl implements MainExpenseRepository {
  final MainExpenseService _mainExpenseService;

  MainExpenseRepositoryImpl(this._mainExpenseService);

  @override
  Future<DataState<ApiResult>> create(
      {required MainExpenseParamsCreate params,
      ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>> delete(
      {required MainExpenseParamsDelete params,
      ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>> getAll(
      {required MainExpenseParamsGetAll params,
      ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>> getAllBySkipOffset(
      {required MainExpenseParamsGetAllBySkipOffset params,
      ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) {
    // TODO: implement getAllBySkipOffset
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>> getById(
      {required MainExpenseParamsGetById params,
      ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>> update(
      {required MainExpenseParamsUpdate params,
      ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfMainExpenseComparison>?>
      getComparison(
          {required MainExpenseParamsGetComparison params,
          ConditionValueOperator<
                  DataState<ApiResultOfEnumerableOfMainExpenseComparison>?>?
              onSuccess,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<List<String>>? onfail}) async {
    return await NetworkOperator<ApiResultOfEnumerableOfMainExpenseComparison>(
      requestFunction: _mainExpenseService.getComparison(
        bearerToken: params.bearerToken,
        xArea: params.xArea,
      ),
      onSuccess: onSuccess,
      onFail: onfail,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfMainExpenseMostUsedDto>?> getMostUsed(
      {required MainExpenseParamsGetMostUsed params,
      ConditionValueOperator<
              DataState<ApiResultOfEnumerableOfMainExpenseMostUsedDto>?>?
          onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) async {
    return await NetworkOperator<ApiResultOfEnumerableOfMainExpenseMostUsedDto>(
      requestFunction: _mainExpenseService.getMostUsed(
          bearerToken: params.bearerToken, xArea: params.xArea),
      onSuccess: onSuccess,
      onFail: onfail,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }
}
