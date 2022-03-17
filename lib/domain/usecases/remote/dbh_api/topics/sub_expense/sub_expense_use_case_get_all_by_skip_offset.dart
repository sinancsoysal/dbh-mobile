import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_enumerable_of_sub_expense.dart';
import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_all_by_skip_offset.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';

class SubExpenseGetAllBySkipOffsetUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfSubExpense>,
            SubExpenseParamsGetAllBySkipOffset> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseGetAllBySkipOffsetUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfSubExpense>> call(
          {required SubExpenseParamsGetAllBySkipOffset params}) =>
      _subExpenseRepository.getAllBySkipOffset(params: params);
}
