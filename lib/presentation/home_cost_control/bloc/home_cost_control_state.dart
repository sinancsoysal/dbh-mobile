part of 'home_cost_control_bloc.dart';

enum ExpenseMonths { previous, current }

class HomeCostControlState extends Equatable {
  final FetchingStatus mostUsedExpenseFetchingStatus;
  final FetchingStatus expenseComparisonFetcingStatus;
  final FetchingStatus latestLogsFetcingStatus;

  final List<MainExpenseComparison> mainExpenseComparisonsList;
  final List<MainExpenseMostUsedDto> mostUsedMainExpensesList;
  final List<ActivityLogWithDetailDto> latestLogsList;

  final double totalExpense;
  final ExpenseMonths expenseMonths;

  final bool sortDesc;

  const HomeCostControlState({
    this.mostUsedExpenseFetchingStatus = FetchingStatus.unknown,
    this.expenseComparisonFetcingStatus = FetchingStatus.unknown,
    this.latestLogsFetcingStatus = FetchingStatus.unknown,
    this.mainExpenseComparisonsList = const [],
    this.mostUsedMainExpensesList = const [],
    this.latestLogsList = const [],
    this.totalExpense = 0.0,
    this.expenseMonths = ExpenseMonths.current,
    this.sortDesc = true,
  });

  HomeCostControlState copyWith({
    FetchingStatus? mostUsedExpenseFetchingStatus,
    FetchingStatus? expenseComparisonFetcingStatus,
    FetchingStatus? latestLogsFetcingStatus,
    List<MainExpenseComparison>? mainExpenseComparisonsList,
    List<MainExpenseMostUsedDto>? mostUsedMainExpensesList,
    List<ActivityLogWithDetailDto>? latestLogsList,
    double? totalExpense,
    ExpenseMonths? expenseMonths,
    bool? sortDesc,
  }) {
    return HomeCostControlState(
      mostUsedExpenseFetchingStatus:
          mostUsedExpenseFetchingStatus ?? this.mostUsedExpenseFetchingStatus,
      expenseComparisonFetcingStatus:
          expenseComparisonFetcingStatus ?? this.expenseComparisonFetcingStatus,
      latestLogsFetcingStatus:
          latestLogsFetcingStatus ?? this.latestLogsFetcingStatus,
      mainExpenseComparisonsList:
          mainExpenseComparisonsList ?? this.mainExpenseComparisonsList,
      mostUsedMainExpensesList:
          mostUsedMainExpensesList ?? this.mostUsedMainExpensesList,
      latestLogsList: latestLogsList ?? this.latestLogsList,
      totalExpense: totalExpense ?? this.totalExpense,
      expenseMonths: expenseMonths ?? this.expenseMonths,
      sortDesc: sortDesc ?? this.sortDesc,
    );
  }

  @override
  List<Object> get props => [
        mostUsedExpenseFetchingStatus,
        expenseComparisonFetcingStatus,
        latestLogsFetcingStatus,
        latestLogsList,
        totalExpense,
        sortDesc,
        expenseMonths,
      ];
}
