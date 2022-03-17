import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceGetAllUseCase
    implements
        UseCaseWithOperators<DataState<ApiResultOfEnumerableOfInvoice>?,
            InvoiceParamsGetAll> {
  final InvoiceRepository _invoiceRepository;

  InvoiceGetAllUseCase(this._invoiceRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoice>?> call(
          {required InvoiceParamsGetAll params,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<DataState<ApiResultOfEnumerableOfInvoice>>?
              onSuccess,
          ConditionValueOperator<List<String>>? onfail}) async =>
      await _invoiceRepository.getAll(
        params: params,
        onAuthorizationFail: onAuthorizationFail,
        onSuccess: onSuccess,
        onfail: onfail,
      );
}
