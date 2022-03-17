import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_all.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_enumerable_of_sub_expense.dart';
import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';

class SubExpenseOneGetllUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfSubExpense>,
            SubExpenseParamsGetAll> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseOneGetllUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfSubExpense>> call(
          {required SubExpenseParamsGetAll params}) =>
      _subExpenseRepository.getAll(params: params);
}
