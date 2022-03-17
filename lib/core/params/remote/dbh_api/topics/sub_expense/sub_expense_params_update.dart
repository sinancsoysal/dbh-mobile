import '../../../../../../data/models/dtos/remote/dbh_api/topics/sub_expense_one/update_sub_expense_dto.dart';

class SubExpenseParamsUpdate {
  final String bearerToken;
  final UpdateSubExpense1Dto updateSubExpense1Dto;
  SubExpenseParamsUpdate({
    required this.bearerToken,
    required this.updateSubExpense1Dto,
  });
}
