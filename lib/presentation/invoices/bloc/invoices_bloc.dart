import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/invoice/invoice_with_items_dto.dart';
import 'invoices_repository.dart';
import 'package:equatable/equatable.dart';
part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  final InvoicesBlocRepository _invoicesBlocRepository;
  InvoicesBloc({required InvoicesBlocRepository repository})
      : _invoicesBlocRepository = repository,
        super(const InvoicesState()) {
    on<InvoicesRequested>(_onInvoicesRequested);
    on<InvoicesFetchingStatusChanged>(_onInvoicesFetchingStatusChanged);
    on<SearchTextChanged>(_onSearchTextChanged);
    on<InvoicesSort>(_onInvoicesSort);

    invoicesFetchingStreamSubscription =
        _invoicesBlocRepository.status.listen((event) {
      add(InvoicesFetchingStatusChanged(event));
    });
  }

  late StreamSubscription<FetchingStatus> invoicesFetchingStreamSubscription;

  FutureOr<void> _onInvoicesRequested(
    InvoicesRequested event,
    Emitter<InvoicesState> emit,
  ) async {
    await _invoicesBlocRepository.fetchInvoices();
  }

  FutureOr<void> _onSearchTextChanged(
    SearchTextChanged event,
    Emitter<InvoicesState> emit,
  ) {
    _invoicesBlocRepository.queryInvoices(event.value);
    emit(state.copyWith(
      invoicesWithItems: _invoicesBlocRepository.queriedInvoicesWithItems,
    ));
  }

  FutureOr<void> _onInvoicesFetchingStatusChanged(
    InvoicesFetchingStatusChanged event,
    Emitter<InvoicesState> emit,
  ) async {
    return emit(
      state.copyWith(
        status: event.status,
        invoicesWithItems: _invoicesBlocRepository.invoicesWithItems,
      ),
    );
  }

  @override
  Future<void> close() {
    invoicesFetchingStreamSubscription.cancel();
    return super.close();
  }

  FutureOr<void> _onInvoicesSort(
    InvoicesSort event,
    Emitter<InvoicesState> emit,
  ) {
    _invoicesBlocRepository.sort();
    emit(state.copyWith(
        invoicesWithItems: _invoicesBlocRepository.queriedInvoicesWithItems,
        sortDesc: _invoicesBlocRepository.sortDesc));
  }
}
