import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_create.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_delete.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_get_by_id.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_get_by_invoice.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_query_invoice.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_update.dart';
import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_upload_attachment.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_invoice.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';

abstract class InvoiceItemRepository {
  Future<DataState<ApiResult>> create({InvoiceItemParamsCreate params});
  Future<DataState<ApiResult>> update({InvoiceItemParamsUpdate params});
  Future<DataState<ApiResult>> delete({InvoiceItemParamsDelete params});
  Future<DataState<ApiResult>> uploadAttachment(
      {InvoiceItemParamsUploadAttachment params});
  Future<DataState<ApiResultOfInvoice>> getById(
      {InvoiceItemParamsGetById params});
  Future<DataState<ApiResultOfEnumerableOfInvoice>> getByInvoice(
      {InvoiceItemParamsGetByInvoice params});
  Future<DataState<ApiResultOfEnumerableOfInvoice>> queryByInvoice(
      {InvoiceItemParamsQueryByInvoice params});
}
