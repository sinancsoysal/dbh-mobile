import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_query_invoice.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice_item/invoice_item_repository.dart';

class InvoiceItemQueryInvoiceUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfInvoice>,
            InvoiceItemParamsQueryByInvoice> {
  final InvoiceItemRepository _invoiceItemRepository;

  InvoiceItemQueryInvoiceUseCase(this._invoiceItemRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoice>> call(
          {required InvoiceItemParamsQueryByInvoice params}) =>
      _invoiceItemRepository.queryByInvoice(params: params);
}
