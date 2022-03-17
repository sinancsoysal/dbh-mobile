import '../../../../../../data/models/dtos/remote/dbh_api/topics/main_expense/update_main_expense_dto.dart';

class MainExpenseParamsUpdate {
  final String bearerToken;
  final String xArea;

  final UpdateMainExpenseDto updateMainExpenseDto;
  MainExpenseParamsUpdate({
    required this.bearerToken,
    required this.updateMainExpenseDto,
    required this.xArea,
  });
}
