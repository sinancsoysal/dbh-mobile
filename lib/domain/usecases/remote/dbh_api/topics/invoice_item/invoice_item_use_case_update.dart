import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_update.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice_item/invoice_item_repository.dart';

class InvoiceItemUpdateUseCase
    implements UseCase<DataState<ApiResult>, InvoiceItemParamsUpdate> {
  final InvoiceItemRepository _invoiceItemRepository;

  InvoiceItemUpdateUseCase(this._invoiceItemRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required InvoiceItemParamsUpdate params}) =>
      _invoiceItemRepository.update(params: params);
}
