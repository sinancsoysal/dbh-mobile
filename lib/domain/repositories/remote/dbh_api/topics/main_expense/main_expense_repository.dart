import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_most_used.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_comparison.dart';

import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_create.dart';
import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_delete.dart';
import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_all.dart';
import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_all_by_skip_offset.dart';
import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_by_id.dart';
import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_comparison.dart';
import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_update.dart';
import '../../../../../../data/models/dtos/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_most_used_dto.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';

abstract class MainExpenseRepository {
  Future<DataState<ApiResult>?> create({
    required MainExpenseParamsCreate params,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResult>?> update({
    required MainExpenseParamsUpdate params,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResult>?> delete({
    required MainExpenseParamsDelete params,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResult>?> getById({
    required MainExpenseParamsGetById params,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResult>?> getAll({
    required MainExpenseParamsGetAll params,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfEnumerableOfMainExpenseMostUsedDto>?>
      getMostUsed({
    required MainExpenseParamsGetMostUsed params,
    ConditionValueOperator<
            DataState<ApiResultOfEnumerableOfMainExpenseMostUsedDto>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfEnumerableOfMainExpenseComparison>?>
      getComparison({
    required MainExpenseParamsGetComparison params,
    ConditionValueOperator<
            DataState<ApiResultOfEnumerableOfMainExpenseComparison>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResult>?> getAllBySkipOffset({
    required MainExpenseParamsGetAllBySkipOffset params,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
}
