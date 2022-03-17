import 'package:json_annotation/json_annotation.dart';

import 'main_expense_comparasion.dart';

import '../../../../base_response_model.dart';
part 'api_result_of_enumerable_of_main_expense_comparison.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfMainExpenseComparison
    implements BaseResponseModel<List<MainExpenseComparison>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<MainExpenseComparison>? data;
  ApiResultOfEnumerableOfMainExpenseComparison({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfEnumerableOfMainExpenseComparison.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfMainExpenseComparisonFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfMainExpenseComparisonToJson(this);
}
