import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_get_by_invoice.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice_item/invoice_item_repository.dart';

class InvoiceItemGtByInvoiceUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfInvoice>,
            InvoiceItemParamsGetByInvoice> {
  final InvoiceItemRepository _invoiceItemRepository;

  InvoiceItemGtByInvoiceUseCase(this._invoiceItemRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoice>> call(
          {required InvoiceItemParamsGetByInvoice params}) =>
      _invoiceItemRepository.getByInvoice(params: params);
}
