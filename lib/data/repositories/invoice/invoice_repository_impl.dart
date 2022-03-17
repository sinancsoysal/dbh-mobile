import '../../../config/network/network_operator.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all_with_items.dart';
import '../../data_sources/remote/dbh_api/topics/invoice/invoice_service.dart';
import '../../models/dtos/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice_with_items_dto.dart';
import '../../models/models/remote/dbh_api/topics/invoice/api_result_of_invoice.dart';
import '../../models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../models/models/api_result_of_string.dart';
import '../../models/models/api_result.dart';
import '../../../core/resources/use_case.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_update.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_import_excel.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_by_id.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all_by_skip_offset.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_export_excel.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_delete.dart';
import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_create.dart';
import 'dart:io';

import '../../../domain/repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceRepositoryImpl implements InvoiceRepository {
  final InvoiceService _invoiceService;

  InvoiceRepositoryImpl(this._invoiceService);
  @override
  Future<DataState<ApiResultOfString>> create(
      {required InvoiceParamsCreate params,
      ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
          onSuccess,
      ConditionOperator? onAuthorizationFail,
      ConditionValueOperator<List<String>>? onfail}) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>> delete({
    required InvoiceParamsDelete params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<DataState<File>> exportExcel({
    required InvoiceParamsExportExcell params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) {
    // TODO: implement exportExcel
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoice>?> getAll({
    required InvoiceParamsGetAll params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) async {
    return await NetworkOperator<ApiResultOfEnumerableOfInvoice>(
      requestFunction: _invoiceService.getAll(
          bearerToken: params.bearerToken, xArea: params.xArea),
      onFail: onfail,
      onSuccess: onSuccess,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoice>> getAllBySkipOffset({
    required InvoiceParamsGetAllBySkipOffset params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) {
    // TODO: implement getAllBySkipOffset
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResultOfInvoice>> getById({
    required InvoiceParamsGetById params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResultOfString>> importExcel({
    required InvoiceParamsImportExcel params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) {
    // TODO: implement importExcel
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResult>> update({
    required InvoiceParamsUpdate params,
    ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>?>?
        onSuccess,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<List<String>>? onfail,
  }) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoiceWithItemsDto>?>
      getAllWithItems(
          {required InvoiceParamsGetAllWithItems params,
          ConditionValueOperator<
                  DataState<ApiResultOfEnumerableOfInvoiceWithItemsDto>?>?
              onSuccess,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<List<String>>? onfail}) async {
    return await NetworkOperator<ApiResultOfEnumerableOfInvoiceWithItemsDto>(
      requestFunction: _invoiceService.getAllWithItems(
          bearerToken: params.bearerToken, xArea: params.xArea),
      onFail: onfail,
      onSuccess: onSuccess,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }
}
