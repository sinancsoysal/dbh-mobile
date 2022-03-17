import '../../../../../../data/models/dtos/remote/dbh_api/topics/main_expense/create_main_expense_dto.dart';

class MainExpenseParamsCreate {
  final String bearerToken;
  final CreateMainExpenseDto createMainExpenseDto;
  final String xArea;

  MainExpenseParamsCreate({
    required this.bearerToken,
    required this.createMainExpenseDto,
    required this.xArea,
  });
}
