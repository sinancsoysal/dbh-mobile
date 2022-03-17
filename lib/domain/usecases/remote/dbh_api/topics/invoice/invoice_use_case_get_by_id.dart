import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_by_id.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice_item/api_result_of_invoice.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceGetByIdUseCase
    implements UseCase<DataState<ApiResultOfInvoice>?, InvoiceParamsGetById> {
  final InvoiceRepository _invoiceRepository;

  InvoiceGetByIdUseCase(this._invoiceRepository);

  @override
  Future<DataState<ApiResultOfInvoice>?> call(
          {required InvoiceParamsGetById params}) =>
      _invoiceRepository.getById(params: params);
}
