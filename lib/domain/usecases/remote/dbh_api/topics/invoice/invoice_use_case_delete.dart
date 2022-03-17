import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_delete.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceDeleteUseCase
    implements UseCase<DataState<ApiResult>?, InvoiceParamsDelete> {
  final InvoiceRepository _invoiceRepository;

  InvoiceDeleteUseCase(this._invoiceRepository);

  @override
  Future<DataState<ApiResult>?> call({required InvoiceParamsDelete params}) =>
      _invoiceRepository.delete(params: params);
}
