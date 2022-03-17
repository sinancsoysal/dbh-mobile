import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_create.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result_of_string.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceCreateUseCase
    implements UseCase<DataState<ApiResultOfString>?, InvoiceParamsCreate> {
  final InvoiceRepository _invoiceRepository;

  InvoiceCreateUseCase(this._invoiceRepository);

  @override
  Future<DataState<ApiResultOfString>?> call(
          {required InvoiceParamsCreate params}) =>
      _invoiceRepository.create(params: params);
}
