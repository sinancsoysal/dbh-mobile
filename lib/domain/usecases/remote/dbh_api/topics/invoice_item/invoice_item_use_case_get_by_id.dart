import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_get_by_id.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_invoice.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice_item/invoice_item_repository.dart';

class InvoiceItemGetByIdUseCase
    implements
        UseCase<DataState<ApiResultOfInvoice>, InvoiceItemParamsGetById> {
  final InvoiceItemRepository _invoiceItemRepository;

  InvoiceItemGetByIdUseCase(this._invoiceItemRepository);

  @override
  Future<DataState<ApiResultOfInvoice>> call(
          {required InvoiceItemParamsGetById params}) =>
      _invoiceItemRepository.getById(params: params);
}
