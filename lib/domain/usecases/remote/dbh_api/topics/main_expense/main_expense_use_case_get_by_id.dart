import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_by_id.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseGetByIdUseCase
    implements UseCase<DataState<ApiResult>?, MainExpenseParamsGetById> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseGetByIdUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResult>?> call(
          {required MainExpenseParamsGetById params}) =>
      _mainExpenseRepository.getById(params: params);
}
