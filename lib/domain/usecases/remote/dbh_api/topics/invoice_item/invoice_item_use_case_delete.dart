import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_delete.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice_item/invoice_item_repository.dart';

class InvoiceItemDeleteUseCase
    implements UseCase<DataState<ApiResult>, InvoiceItemParamsDelete> {
  final InvoiceItemRepository _invoiceItemRepository;

  InvoiceItemDeleteUseCase(this._invoiceItemRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required InvoiceItemParamsDelete params}) =>
      _invoiceItemRepository.delete(params: params);
}
