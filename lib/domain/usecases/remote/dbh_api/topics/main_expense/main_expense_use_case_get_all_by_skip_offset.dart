import '../../../../../../core/params/remote/dbh_api/topics/main_expense/main_expense_params_get_all_by_skip_offset.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';

class MainExpenseGetAllBySkipOffsetUseCase
    implements
        UseCase<DataState<ApiResult>?, MainExpenseParamsGetAllBySkipOffset> {
  final MainExpenseRepository _mainExpenseRepository;

  MainExpenseGetAllBySkipOffsetUseCase(this._mainExpenseRepository);

  @override
  Future<DataState<ApiResult>?> call(
          {required MainExpenseParamsGetAllBySkipOffset params}) =>
      _mainExpenseRepository.getAllBySkipOffset(params: params);
}
