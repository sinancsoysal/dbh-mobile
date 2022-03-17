part of 'home_cost_control_bloc.dart';

abstract class HomeCostControlEvent extends Equatable {
  const HomeCostControlEvent();

  @override
  List<Object> get props => [];
}

class FetchMostUsedExpenses extends HomeCostControlEvent {
  const FetchMostUsedExpenses();

  @override
  List<Object> get props => [];
}

class FetchExpenseComparison extends HomeCostControlEvent {
  const FetchExpenseComparison();

  @override
  List<Object> get props => [];
}

class FetchLatestLogs extends HomeCostControlEvent {
  const FetchLatestLogs();

  @override
  List<Object> get props => [];
}

class LatestLogsFetchingStatusChanged extends HomeCostControlEvent {
  const LatestLogsFetchingStatusChanged(this.status);

  final FetchingStatus status;

  @override
  List<Object> get props => [status];
}

class ExpenseComparisonFetchingStatusChanged extends HomeCostControlEvent {
  const ExpenseComparisonFetchingStatusChanged(this.status);

  final FetchingStatus status;

  @override
  List<Object> get props => [status];
}

class MostUsedExpensesFetchingStatusChanged extends HomeCostControlEvent {
  const MostUsedExpensesFetchingStatusChanged(this.status);

  final FetchingStatus status;

  @override
  List<Object> get props => [status];
}

class SwitchNextMonth extends HomeCostControlEvent {
  const SwitchNextMonth();

  @override
  List<Object> get props => [];
}

class SwitchPreviousMonth extends HomeCostControlEvent {
  const SwitchPreviousMonth();

  @override
  List<Object> get props => [];
}

class HomeCostControlSort extends HomeCostControlEvent {
  const HomeCostControlSort(this.value, {this.sortDesc = true});

  final CostControlSort value;
  final bool sortDesc;

  @override
  List<Object> get props => [value, sortDesc];
}

enum CostControlSort { date, admin, user, manager }

class SearchActivityLog extends HomeCostControlEvent {
  const SearchActivityLog(this.value);

  final String value;

  @override
  List<Object> get props => [value];
}
