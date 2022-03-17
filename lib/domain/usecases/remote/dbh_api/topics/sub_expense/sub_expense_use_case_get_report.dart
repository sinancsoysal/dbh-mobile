import '../../../../../../core/params/remote/dbh_api/topics/sub_expense/sub_expense_params_get_report.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/sub_expense/api_result_of_enumerable_of_expense_report_dto.dart';
import '../../../../../repositories/remote/dbh_api/topics/sub_expense/sub_expense_repository.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';

class SubExpenseOneGetReportUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfExpenseReportDto>,
            SubExpenseParamsGetReport> {
  final SubExpenseRepository _subExpenseRepository;

  SubExpenseOneGetReportUseCase(this._subExpenseRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfExpenseReportDto>> call(
          {required SubExpenseParamsGetReport params}) =>
      _subExpenseRepository.getReport(params: params);
}
