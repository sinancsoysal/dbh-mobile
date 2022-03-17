import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_update.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseUpdateUseCase
    implements UseCase<DataState<ApiResult>?, MainExpenseParamsUpdate> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseUpdateUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResult>?> call(
          {required MainExpenseParamsUpdate params}) =>
      _mainExpenseRepository.update(params: params);
}
