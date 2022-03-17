import 'package:json_annotation/json_annotation.dart';

import '../../../../base_response_model.dart';
import 'main_expense.dart';

part 'api_result_of_main_expense.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfMainExpense implements BaseResponseModel<MainExpense?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final MainExpense? data;
  ApiResultOfMainExpense({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfMainExpense.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfMainExpenseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfMainExpenseToJson(this);
}
