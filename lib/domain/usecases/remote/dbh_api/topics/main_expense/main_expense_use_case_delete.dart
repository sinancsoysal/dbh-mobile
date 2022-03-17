import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_delete.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseDeleteUseCase
    implements UseCase<DataState<ApiResult>?, MainExpenseParamsDelete> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseDeleteUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResult>?> call(
          {required MainExpenseParamsDelete params}) =>
      _mainExpenseRepository.delete(params: params);
}
