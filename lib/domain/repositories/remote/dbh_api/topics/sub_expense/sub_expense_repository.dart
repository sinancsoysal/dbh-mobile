import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_create.dart';
import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_delete.dart';
import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_all.dart';
import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_all_by_skip_offset.dart';
import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_by_id.dart';
import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_by_main_expense_id.dart';
import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_report.dart';
import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_update.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_enumerable_of_expense_report_dto.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_enumerable_of_sub_expense.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_sub_expense.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_sub_expense_dto.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';

abstract class SubExpenseRepository {
  Future<DataState<ApiResult>> create({SubExpenseParamsCreate params});
  Future<DataState<ApiResult>> update({SubExpenseParamsUpdate params});
  Future<DataState<ApiResult>> delete({SubExpenseParamsDelete params});
  Future<DataState<ApiResultOfSubExpense>> getById(
      {SubExpenseParamsGetById params});
  Future<DataState<ApiResultOfEnumerableOfSubExpense>> getAll(
      {SubExpenseParamsGetAll params});
  Future<DataState<ApiResultOfEnumerableOfExpenseReportDto>> getReport(
      {SubExpenseParamsGetReport params});
  Future<DataState<ApiResultOfSubExpenseDto>> getByMainExpenseId(
      {SubExpenseParamsGetByMainExpenseId params});
  Future<DataState<ApiResultOfEnumerableOfSubExpense>> getAllBySkipOffset(
      {SubExpenseParamsGetAllBySkipOffset params});
}
