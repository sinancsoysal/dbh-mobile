part of 'invoices_bloc.dart';

abstract class InvoicesEvent extends Equatable {
  const InvoicesEvent();

  @override
  List<Object> get props => [];
}

class InvoicesRequested extends InvoicesEvent {}

class InvoicesFetchingStatusChanged extends InvoicesEvent {
  final FetchingStatus status;

  const InvoicesFetchingStatusChanged(this.status);
}

class SearchTextChanged extends InvoicesEvent {
  final String value;

  const SearchTextChanged(this.value);
}

class InvoicesSort extends InvoicesEvent {
  const InvoicesSort({this.descOrder = true});

  final bool descOrder;

  @override
  List<Object> get props => [descOrder];
}
