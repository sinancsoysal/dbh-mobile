import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_create.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseCreateUseCase
    implements UseCase<DataState<ApiResult>?, MainExpenseParamsCreate> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseCreateUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResult>?> call(
          {required MainExpenseParamsCreate params}) =>
      _mainExpenseRepository.create(params: params);
}
