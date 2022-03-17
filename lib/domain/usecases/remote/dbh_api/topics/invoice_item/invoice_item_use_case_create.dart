import '../../../../../../core/params/remote/dbh_api/topics/invoice_item/invoice_item_params_create.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice_item/invoice_item_repository.dart';

class InvoiceItemCreateUseCase
    implements UseCase<DataState<ApiResult>, InvoiceItemParamsCreate> {
  final InvoiceItemRepository _invoiceItemRepository;

  InvoiceItemCreateUseCase(this._invoiceItemRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required InvoiceItemParamsCreate params}) =>
      _invoiceItemRepository.create(params: params);
}
