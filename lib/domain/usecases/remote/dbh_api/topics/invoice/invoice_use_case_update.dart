import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_update.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceUpdateUseCase
    implements UseCase<DataState<ApiResult>?, InvoiceParamsUpdate> {
  final InvoiceRepository _invoiceRepository;

  InvoiceUpdateUseCase(this._invoiceRepository);

  @override
  Future<DataState<ApiResult>?> call({required InvoiceParamsUpdate params}) =>
      _invoiceRepository.update(params: params);
}
