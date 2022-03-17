import 'dart:async';

import '../../../core/params/remote/dbh_api/topics/activity_log/activity_params_get_latest_logs.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_comparison.dart';
import '../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_most_used.dart';
import '../../../core/utils/enums/fetching_status_enum.dart';
import '../../../core/utils/extensions/string/string_to_token_extension.dart';
import '../../../data/data_sources/local/preferences_manager.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/activity_log/activity_log_with_detail_dto.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/main_expense/main_expense_most_used_dto.dart';
import '../../../data/models/models/remote/dbh_api/topics/main_expense/main_expense_comparasion.dart';
import '../../../domain/usecases/remote/dbh_api/topics/activity_log/activity_log_get_latest_logs.dart';
import '../../../domain/usecases/remote/dbh_api/topics/main_expense/main_expense_use_case_get_comparison.dart';
import '../../../domain/usecases/remote/dbh_api/topics/main_expense/main_expense_use_case_get_most_used.dart';
import 'home_cost_control_bloc.dart';
import '../../widgets/template_components/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BlocRepositoryOfHomeCostControl {
  BlocRepositoryOfHomeCostControl(
    BuildContext context,
    this._mainExpenseGetMostUsedUseCase,
    this._mainExpenseGetComparisonUseCase,
    this._activityLogGetLatestLogsUseCase,
  ) : _context = context;

  final BuildContext _context;
  final MainExpenseGetComparisonUseCase _mainExpenseGetComparisonUseCase;
  final MainExpenseGetMostUsedUseCase _mainExpenseGetMostUsedUseCase;
  final ActivityLogGetLatestLogsUseCase _activityLogGetLatestLogsUseCase;
  final StreamController<FetchingStatus> expenseComparisonFetchStatusStream =
      StreamController<FetchingStatus>();
  final StreamController<FetchingStatus> mostUsedExpenseFetchStatusStream =
      StreamController<FetchingStatus>();
  final StreamController<FetchingStatus> latestLogsFetchStatusStream =
      StreamController<FetchingStatus>();

  String? get getCachedToken =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.token);
  String? get getCachedxArea =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.xarea);

  List<MainExpenseMostUsedDto>? mostUsedMainExpensesList = [];
  List<MainExpenseComparison>? mainExpenseComparisonsList = [];
  List<ActivityLogWithDetailDto>? latestLogsList = [];
  List<ActivityLogWithDetailDto>? queriedLatestLogsList = [];

  double? currentMonthTotalExpense = 0;
  double? previousMonthTotalExpenses = 0;
  bool sortDesc = false;

  Stream<FetchingStatus> get mostUsedMainExpenseFetchStatus async* {
    yield* mostUsedExpenseFetchStatusStream.stream;
  }

  Stream<FetchingStatus> get mainExpenseMonthComparisonFetchStatus async* {
    yield* expenseComparisonFetchStatusStream.stream;
  }

  Stream<FetchingStatus> get latestLogsFetchStatus async* {
    yield* latestLogsFetchStatusStream.stream;
  }

  fetchLatestLogs() async {
    latestLogsFetchStatusStream.add(FetchingStatus.loading);

    await _activityLogGetLatestLogsUseCase(
      params:
          ActivityLogParamsGetLatestLogs(bearerToken: getCachedToken!.tokenize),
      onSuccess: (result) {
        latestLogsList = result?.value?.data;
        queriedLatestLogsList = latestLogsList;
        latestLogsFetchStatusStream.add(FetchingStatus.loaded);
      },
      onfail: (errors) {
        var errorMessage = errors?.reduce(
          (value, element) => value + "\n" + element,
        );
        CustomSnackBar(_context, errorMessage).show;
        latestLogsFetchStatusStream.add(FetchingStatus.failed);
      },
      onAuthorizationFail: () {
        latestLogsFetchStatusStream.add(FetchingStatus.failed);
      },
    );
  }

  fetchMostUsedMainExpense() async {
    mostUsedExpenseFetchStatusStream.add(FetchingStatus.loading);

    await _mainExpenseGetMostUsedUseCase(
      params: MainExpenseParamsGetMostUsed(
          bearerToken: getCachedToken!.tokenize, xArea: getCachedxArea ?? ''),
      onSuccess: (result) {
        mostUsedMainExpensesList = result?.value?.data;
        mostUsedExpenseFetchStatusStream.add(FetchingStatus.loaded);
      },
      onfail: (errors) {
        var errorMessage = errors?.reduce(
          (value, element) => value + "\n" + element,
        );
        CustomSnackBar(_context, errorMessage).show;
        mostUsedExpenseFetchStatusStream.add(FetchingStatus.failed);
      },
      onAuthorizationFail: () {
        mostUsedExpenseFetchStatusStream.add(FetchingStatus.failed);
      },
    );
  }

  fetchMainExpenseComparison() async {
    print(getCachedxArea);
    expenseComparisonFetchStatusStream.add(FetchingStatus.loading);
    await _mainExpenseGetComparisonUseCase(
      params: MainExpenseParamsGetComparison(
          bearerToken: getCachedToken!.tokenize, xArea: getCachedxArea ?? ""),
      onSuccess: (result) {
        mainExpenseComparisonsList = result?.value?.data;

        currentMonthTotalExpense = mainExpenseComparisonsList?.fold<double>(
            0,
            (previousValue, element) =>
                previousValue + element.currentMonthTotalPrice);
        previousMonthTotalExpenses = mainExpenseComparisonsList?.fold<double>(
            0,
            (previousValue, element) =>
                previousValue + element.previousMonthTotalPrice);

        expenseComparisonFetchStatusStream.add(FetchingStatus.loaded);
      },
      onfail: (errors) {
        var errorMessage = errors?.reduce(
          (value, element) => value + "\n" + element,
        );
        CustomSnackBar(_context, errorMessage).show;
        expenseComparisonFetchStatusStream.add(FetchingStatus.failed);
      },
      onAuthorizationFail: () {
        CustomSnackBar(
                _context, "Oturum süreniz doldu\nLütfen tekrar Giriş yapınız")
            .show;
        expenseComparisonFetchStatusStream.add(FetchingStatus.failed);
      },
    );
  }

  void sort(CostControlSort value) {
    DateFormat format = DateFormat("hh:mm");
    sortDesc = !sortDesc;
    switch (value) {
      case CostControlSort.date:
        latestLogsList!.sort(
          (a, b) {
            return format
                .parse(sortDesc ? b.createdTime! : a.createdTime!)
                .compareTo(
                  format.parse(sortDesc ? a.createdTime! : b.createdTime!),
                );
          },
        );
        if (latestLogsList != null) {
          queriedLatestLogsList = List.of(latestLogsList!);
        }
        break;
      case CostControlSort.admin:
        queriedLatestLogsList = latestLogsList
            ?.where(
              (element) => element.userRole
                  .toString()
                  .toLowerCase()
                  .contains("administrator"),
            )
            .toList();
        break;
      case CostControlSort.user:
        queriedLatestLogsList = latestLogsList
            ?.where(
              (element) =>
                  element.userRole.toString().toLowerCase().contains("user"),
            )
            .toList();
        break;
      case CostControlSort.manager:
        queriedLatestLogsList = latestLogsList
            ?.where(
              (element) =>
                  element.userRole.toString().toLowerCase().contains("manager"),
            )
            .toList();
        break;
    }
  }

  void queryLogs(String value) {
    queriedLatestLogsList = latestLogsList
        ?.where(
          (element) => ((element.userName.toString().toLowerCase().contains(
                    value.toLowerCase(),
                  )) ||
              element.operation.toLowerCase().contains(
                    value.toLowerCase(),
                  ) ||
              element.createdDate.toString().toLowerCase().contains(
                    value.toLowerCase(),
                  )),
        )
        .toList();
  }

  void dispose() {
    expenseComparisonFetchStatusStream.close();
    mostUsedExpenseFetchStatusStream.close();
  }
}
