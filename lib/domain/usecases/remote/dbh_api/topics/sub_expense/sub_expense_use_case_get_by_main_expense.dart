import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_by_main_expense_id.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_sub_expense_dto.dart';
import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';

class SubExpenseOneGetByMainExpenseIdUseCase
    implements
        UseCase<DataState<ApiResultOfSubExpenseDto>,
            SubExpenseParamsGetByMainExpenseId> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseOneGetByMainExpenseIdUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResultOfSubExpenseDto>> call(
          {required SubExpenseParamsGetByMainExpenseId params}) =>
      _subExpenseRepository.getByMainExpenseId(params: params);
}
