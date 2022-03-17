import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_update.dart';
import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';

class SubExpenseOneUpdateUseCase
    implements UseCase<DataState<ApiResult>, SubExpenseParamsUpdate> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseOneUpdateUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResult>> call({required SubExpenseParamsUpdate params}) =>
      _subExpenseRepository.update(params: params);
}
