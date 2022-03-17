import '../../../../../../data/models/dtos/remote/dbh_api/topics/sub_expense_one/create_sub_expense_dto.dart';

class SubExpenseParamsCreate {
  final String bearerToken;
  final CreateSubExpenseDto createSubExpense1Dto;
  SubExpenseParamsCreate({
    required this.bearerToken,
    required this.createSubExpense1Dto,
  });
}
