import 'dart:async';

import '../../../core/params/remote/dbh_api/topics/invoice/invoice_params_get_all_with_items.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../core/utils/extensions/string/string_to_token_extension.dart';
import '../../../data/data_sources/local/preferences_manager.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/invoice/invoice_with_items_dto.dart';
import '../../../domain/usecases/remote/dbh_api/topics/invoice/invoice_with_items_use_case_get_all.dart';
import 'package:intl/intl.dart';

class InvoicesBlocRepository {
  final InvoiceGetAllWithItemsUseCase _invoiceGetAllWithItemsUseCase;

  InvoicesBlocRepository(this._invoiceGetAllWithItemsUseCase);

  StreamController<FetchingStatus> invoicesFetchingStream =
      StreamController<FetchingStatus>();

  Stream<FetchingStatus> get status async* {
    yield* invoicesFetchingStream.stream;
  }

  bool sortDesc = true;

  List<InvoiceWithItemsDto>? invoicesWithItems;
  List<InvoiceWithItemsDto>? queriedInvoicesWithItems;

  String? get getCachedToken =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.token);
  String? get getXarea =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.xarea);

  fetchInvoices() async {
    invoicesFetchingStream.add(FetchingStatus.loading);
    if (getXarea?.isNotEmpty ?? false) {
      await _invoiceGetAllWithItemsUseCase(
        params: InvoiceParamsGetAllWithItems(
            bearerToken: getCachedToken!.tokenize, xArea: getXarea!),
        onSuccess: (result) {
          if (result?.value != null) {
            invoicesWithItems = result!.value?.data;
            queriedInvoicesWithItems = invoicesWithItems;
          }
          invoicesFetchingStream.add(FetchingStatus.loaded);
        },
        onfail: (error) {
          invoicesFetchingStream.add(FetchingStatus.failed);
        },
        onAuthorizationFail: () {
          invoicesFetchingStream.add(FetchingStatus.failed);
        },
      );
    }
  }

  void queryInvoices(String value) {
    queriedInvoicesWithItems = invoicesWithItems
        ?.where(
          (element) => (element.invoiceNo.toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              element.description.toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              element.issuingCompanyName.toLowerCase().contains(
                    value.toLowerCase(),
                  )),
        )
        .toList();
  }

  void sort() {
    DateFormat format = DateFormat("yyyy-MM-ddTHH:mm:ss");

    sortDesc = !sortDesc;
    invoicesWithItems!.sort(
      (a, b) {
        return format.parse(sortDesc ? b.invoiceDate : a.invoiceDate).compareTo(
              format.parse(sortDesc ? a.invoiceDate : b.invoiceDate),
            );
      },
    );
    if (invoicesWithItems != null) {
      queriedInvoicesWithItems = invoicesWithItems;
    }
  }
}
