import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_by_id.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_sub_expense.dart';
import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';

class SubExpenseOneGetByIdUseCase
    implements
        UseCase<DataState<ApiResultOfSubExpense>, SubExpenseParamsGetById> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseOneGetByIdUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResultOfSubExpense>> call(
          {required SubExpenseParamsGetById params}) =>
      _subExpenseRepository.getById(params: params);
}
