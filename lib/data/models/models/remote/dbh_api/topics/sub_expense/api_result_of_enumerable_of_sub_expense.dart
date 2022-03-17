import '../../../../base_response_model.dart';
import 'sub_expense.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_result_of_enumerable_of_sub_expense.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfSubExpense
    implements BaseResponseModel<List<SubExpense>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<SubExpense>? data;
  ApiResultOfEnumerableOfSubExpense({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfEnumerableOfSubExpense.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfSubExpenseFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfSubExpenseToJson(this);
}
