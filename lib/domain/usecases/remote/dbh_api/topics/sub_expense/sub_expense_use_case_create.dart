import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_create.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';

class SubExpenseCreateUseCase
    implements UseCase<DataState<ApiResult>, SubExpenseParamsCreate> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseCreateUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResult>> call({required SubExpenseParamsCreate params}) =>
      _subExpenseRepository.create(params: params);
}
