import 'dart:async';

import 'package:bloc/bloc.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/activity_log/activity_log_with_detail_dto.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/main_expense/main_expense_most_used_dto.dart';
import '../../../data/models/models/remote/dbh_api/topics/main_expense/main_expense_comparasion.dart';
import 'bloc_repository_of_home_cost_control.dart';
import 'package:equatable/equatable.dart';

part 'home_cost_control_event.dart';
part 'home_cost_control_state.dart';

class HomeCostControlBloc
    extends Bloc<HomeCostControlEvent, HomeCostControlState> {
  HomeCostControlBloc(
      {required BlocRepositoryOfHomeCostControl
          blocRepositoryOfHomeCostControl})
      : _blocRepositoryOfHomeCostControl = blocRepositoryOfHomeCostControl,
        super(const HomeCostControlState()) {
    on<FetchExpenseComparison>(_onFetchExpenseComparison);
    on<FetchMostUsedExpenses>(_onFetchMostUsedExpenses);
    on<FetchLatestLogs>(_onFetchLatestLogs);
    on<LatestLogsFetchingStatusChanged>(_onLatestLogsFetchingStatusChanged);
    on<ExpenseComparisonFetchingStatusChanged>(
        _onExpenseComparisonFetchingStatusChanged);
    on<MostUsedExpensesFetchingStatusChanged>(
        _onMostUsedExpensesFetchingStatusChanged);
    on<SwitchNextMonth>(_onSwitchNextMonth);
    on<SwitchPreviousMonth>(_onSwitchPreviousMonth);
    on<HomeCostControlSort>(_onHomeCostControlSort);
    on<SearchActivityLog>(_onSearchActivityLog);

    _mostUsedExpenseFetchingStatus = _blocRepositoryOfHomeCostControl
        .mostUsedMainExpenseFetchStatus
        .listen((event) {
      add(MostUsedExpensesFetchingStatusChanged(event));
    });

    _expenseComparisonStatus = _blocRepositoryOfHomeCostControl
        .mainExpenseMonthComparisonFetchStatus
        .listen((event) {
      add(ExpenseComparisonFetchingStatusChanged(event));
    });
  }

  final BlocRepositoryOfHomeCostControl _blocRepositoryOfHomeCostControl;
  late StreamSubscription<FetchingStatus> _mostUsedExpenseFetchingStatus;
  late StreamSubscription<FetchingStatus> _expenseComparisonStatus;

  FutureOr<void> _onFetchExpenseComparison(
      FetchExpenseComparison event, Emitter<HomeCostControlState> emit) async {
    await _blocRepositoryOfHomeCostControl.fetchMainExpenseComparison();
  }

  FutureOr<void> _onFetchMostUsedExpenses(
      FetchMostUsedExpenses event, Emitter<HomeCostControlState> emit) async {
    await _blocRepositoryOfHomeCostControl.fetchMostUsedMainExpense();
  }

  FutureOr<void> _onExpenseComparisonFetchingStatusChanged(
      ExpenseComparisonFetchingStatusChanged event,
      Emitter<HomeCostControlState> emit) async {
    switch (event.status) {
      case FetchingStatus.unknown:
        return emit(state.copyWith(
            expenseComparisonFetcingStatus: FetchingStatus.unknown));
      case FetchingStatus.loading:
        return emit(state.copyWith(
            expenseComparisonFetcingStatus: FetchingStatus.loading));
      case FetchingStatus.loaded:
        return emit(
          state.copyWith(
            totalExpense:
                _blocRepositoryOfHomeCostControl.currentMonthTotalExpense,
            mainExpenseComparisonsList:
                _blocRepositoryOfHomeCostControl.mainExpenseComparisonsList,
            expenseComparisonFetcingStatus:
                _blocRepositoryOfHomeCostControl.mainExpenseComparisonsList !=
                        null
                    ? FetchingStatus.loaded
                    : FetchingStatus.failed,
          ),
        );
      case FetchingStatus.failed:
        return emit(state.copyWith(
            expenseComparisonFetcingStatus: FetchingStatus.failed));
    }
  }

  FutureOr<void> _onMostUsedExpensesFetchingStatusChanged(
      MostUsedExpensesFetchingStatusChanged event,
      Emitter<HomeCostControlState> emit) async {
    switch (event.status) {
      case FetchingStatus.unknown:
        return emit(state.copyWith(
            mostUsedExpenseFetchingStatus: FetchingStatus.unknown));
      case FetchingStatus.loading:
        return emit(state.copyWith(
            mostUsedExpenseFetchingStatus: FetchingStatus.loading));
      case FetchingStatus.loaded:
        return emit(
          state.copyWith(
            mostUsedMainExpensesList:
                _blocRepositoryOfHomeCostControl.mostUsedMainExpensesList,
            mostUsedExpenseFetchingStatus:
                _blocRepositoryOfHomeCostControl.mostUsedMainExpensesList !=
                        null
                    ? FetchingStatus.loaded
                    : FetchingStatus.failed,
          ),
        );
      case FetchingStatus.failed:
        return emit(state.copyWith(
            mostUsedExpenseFetchingStatus: FetchingStatus.failed));
    }
  }

  FutureOr<void> _onSwitchNextMonth(
      SwitchNextMonth event, Emitter<HomeCostControlState> emit) {
    emit(
      state.copyWith(
        expenseMonths: ExpenseMonths.current,
        totalExpense: _blocRepositoryOfHomeCostControl.currentMonthTotalExpense,
      ),
    );
  }

  FutureOr<void> _onSwitchPreviousMonth(
      SwitchPreviousMonth event, Emitter<HomeCostControlState> emit) {
    emit(
      state.copyWith(
        expenseMonths: ExpenseMonths.previous,
        totalExpense:
            _blocRepositoryOfHomeCostControl.previousMonthTotalExpenses,
      ),
    );
  }

  FutureOr<void> _onFetchLatestLogs(
    FetchLatestLogs event,
    Emitter<HomeCostControlState> emit,
  ) async {
    await _blocRepositoryOfHomeCostControl.fetchLatestLogs();
  }

  FutureOr<void> _onLatestLogsFetchingStatusChanged(
    LatestLogsFetchingStatusChanged event,
    Emitter<HomeCostControlState> emit,
  ) async {
    switch (event.status) {
      case FetchingStatus.loaded:
        return emit(
          state.copyWith(
            latestLogsList: _blocRepositoryOfHomeCostControl.latestLogsList,
            latestLogsFetcingStatus:
                _blocRepositoryOfHomeCostControl.latestLogsList != null
                    ? FetchingStatus.loaded
                    : FetchingStatus.failed,
          ),
        );
      default:
        return emit(
          state.copyWith(latestLogsFetcingStatus: event.status),
        );
    }
  }

  FutureOr<void> _onHomeCostControlSort(
    HomeCostControlSort event,
    Emitter<HomeCostControlState> emit,
  ) {
    _blocRepositoryOfHomeCostControl.sort(event.value);
    emit(state.copyWith(
      latestLogsList: _blocRepositoryOfHomeCostControl.queriedLatestLogsList,
      sortDesc: _blocRepositoryOfHomeCostControl.sortDesc,
    ));
  }

  @override
  Future<void> close() {
    _expenseComparisonStatus.cancel();
    _mostUsedExpenseFetchingStatus.cancel();
    _blocRepositoryOfHomeCostControl.dispose();
    return super.close();
  }

  FutureOr<void> _onSearchActivityLog(
    SearchActivityLog event,
    Emitter<HomeCostControlState> emit,
  ) {
    _blocRepositoryOfHomeCostControl.queryLogs(event.value);
    emit(
      state.copyWith(
          latestLogsList:
              _blocRepositoryOfHomeCostControl.queriedLatestLogsList),
    );
  }
}
