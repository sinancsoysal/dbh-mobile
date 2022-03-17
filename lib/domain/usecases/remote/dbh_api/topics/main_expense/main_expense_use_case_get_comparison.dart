import '../../../../../../data/models/models/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_comparison.dart';

import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_comparison.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseGetComparisonUseCase
    implements
        UseCaseWithOperators<
            DataState<ApiResultOfEnumerableOfMainExpenseComparison>?,
            MainExpenseParamsGetComparison> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseGetComparisonUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfMainExpenseComparison>?> call(
          {required MainExpenseParamsGetComparison params,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<
                  DataState<ApiResultOfEnumerableOfMainExpenseComparison>?>?
              onSuccess,
          ConditionValueOperator<List<String>>? onfail}) =>
      _mainExpenseRepository.getComparison(
        params: params,
        onAuthorizationFail: onAuthorizationFail,
        onSuccess: onSuccess,
        onfail: onfail,
      );
}
