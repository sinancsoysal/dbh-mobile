import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all_with_items.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';
import '../../../../../../data/models/dtos/remote/dbh_api/topics/invoice/api_result_of_enumerable_of_invoice_with_items_dto.dart';

class InvoiceGetAllWithItemsUseCase
    implements
        UseCaseWithOperators<
            DataState<ApiResultOfEnumerableOfInvoiceWithItemsDto>?,
            InvoiceParamsGetAllWithItems> {
  final InvoiceRepository _invoiceRepository;

  InvoiceGetAllWithItemsUseCase(this._invoiceRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfInvoiceWithItemsDto>?> call(
          {required InvoiceParamsGetAllWithItems params,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<
                  DataState<ApiResultOfEnumerableOfInvoiceWithItemsDto>?>?
              onSuccess,
          ConditionValueOperator<List<String>>? onfail}) async =>
      await _invoiceRepository.getAllWithItems(
        params: params,
        onAuthorizationFail: onAuthorizationFail,
        onSuccess: onSuccess,
        onfail: onfail,
      );
}
