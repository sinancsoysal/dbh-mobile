part of 'invoices_bloc.dart';

class InvoicesState extends Equatable {
  final FetchingStatus status;
  final List<InvoiceWithItemsDto>? invoicesWithItems;
  final bool sortDesc;
  const InvoicesState({
    this.status = FetchingStatus.unknown,
    this.invoicesWithItems,
    this.sortDesc = true,
  });

  InvoicesState copyWith({
    FetchingStatus? status,
    List<InvoiceWithItemsDto>? invoicesWithItems,
    bool? sortDesc,
  }) {
    return InvoicesState(
      status: status ?? this.status,
      invoicesWithItems: invoicesWithItems ?? this.invoicesWithItems,
      sortDesc: sortDesc ?? this.sortDesc,
    );
  }

  @override
  List<Object?> get props => [
        status,
        invoicesWithItems,
        sortDesc,
      ];
}
