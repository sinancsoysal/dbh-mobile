import 'dart:io';

import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all_with_items.dart';
import '../../../../../../core/resources/use_case.dart';

import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_create.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_delete.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_export_excel.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all_by_skip_offset.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_by_id.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_import_excel.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_update.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_invoice.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../../../../../data/models/models/api_result_of_string.dart';
import '../../../../../../data/models/dtos/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice_with_items_dto.dart';

abstract class InvoiceRepository {
  Future<DataState<ApiResultOfString>?> create({
    required InvoiceParamsCreate params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResult>?> update({
    required InvoiceParamsUpdate params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResult>?> delete({
    required InvoiceParamsDelete params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfInvoice>?> getById({
    required InvoiceParamsGetById params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfEnumerableOfInvoice>?> getAll({
    required InvoiceParamsGetAll params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfEnumerableOfInvoice>?> getAllBySkipOffset({
    required InvoiceParamsGetAllBySkipOffset params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfString>?> importExcel({
    required InvoiceParamsImportExcel params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<File>?> exportExcel({
    required InvoiceParamsExportExcell params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<ApiResultOfEnumerableOfInvoiceWithItemsDto>?>
      getAllWithItems({
    required InvoiceParamsGetAllWithItems params,
    ConditionValueOperator<
            DataState<ApiResultOfEnumerableOfInvoiceWithItemsDto>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  });
}
