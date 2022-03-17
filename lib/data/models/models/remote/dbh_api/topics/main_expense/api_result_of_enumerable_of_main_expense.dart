import 'package:json_annotation/json_annotation.dart';

import '../../../../base_response_model.dart';
import 'main_expense.dart';
part 'api_result_of_enumerable_of_main_expense.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfMainExpense
    implements BaseResponseModel<List<MainExpense>> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<MainExpense>? data;
  ApiResultOfEnumerableOfMainExpense({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfEnumerableOfMainExpense.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfMainExpenseFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfMainExpenseToJson(this);
}
