import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all_by_skip_offset.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceGetAllBySkipOffsetUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfInvoice>?,
            InvoiceParamsGetAllBySkipOffset> {
  final InvoiceRepository _invoiceRepository;

  InvoiceGetAllBySkipOffsetUseCase(this._invoiceRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoice>?> call(
          {required InvoiceParamsGetAllBySkipOffset params}) =>
      _invoiceRepository.getAllBySkipOffset(params: params);
}
