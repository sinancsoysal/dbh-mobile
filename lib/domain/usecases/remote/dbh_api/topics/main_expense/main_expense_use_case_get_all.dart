import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_all.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseGetAllUseCase
    implements UseCase<DataState<ApiResult>?, MainExpenseParamsGetAll> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseGetAllUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResult>?> call(
          {required MainExpenseParamsGetAll params}) =>
      _mainExpenseRepository.getAll(params: params);
}
