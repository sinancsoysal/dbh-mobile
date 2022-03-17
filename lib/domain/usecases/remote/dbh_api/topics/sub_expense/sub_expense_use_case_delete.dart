import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_delete.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';

class SubExpenseDeleteUseCase
    implements UseCase<DataState<ApiResult>, SubExpenseParamsDelete> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseDeleteUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResult>> call({required SubExpenseParamsDelete params}) =>
      _subExpenseRepository.delete(params: params);
}
