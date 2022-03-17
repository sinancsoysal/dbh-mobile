import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_most_used.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';
import '../../../../../../data/models/dtos/remote/dbh_api/topics/main_expense/api_result_of_enumerable_of_main_expense_most_used_dto.dart';

class MainExpenseGetMostUsedUseCase
    implements
        UseCaseWithOperators<
            DataState<ApiResultOfEnumerableOfMainExpenseMostUsedDto>?,
            MainExpenseParamsGetMostUsed> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseGetMostUsedUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfMainExpenseMostUsedDto>?> call(
          {required MainExpenseParamsGetMostUsed params,
          ConditionOperator? onAuthorizationFail,
          ConditionValueOperator<
                  DataState<ApiResultOfEnumerableOfMainExpenseMostUsedDto>?>?
              onSuccess,
          ConditionValueOperator<List<String>>? onfail}) =>
      _mainExpenseRepository.getMostUsed(
        params: params,
        onSuccess: onSuccess,
        onAuthorizationFail: onAuthorizationFail,
        onfail: onfail,
      );
}
