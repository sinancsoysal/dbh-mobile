import 'package:json_annotation/json_annotation.dart';

import '../../../../../dtos/remote/dbh_api/topics/sub_expense_one/expense_report_dto.dart';

import '../../../../base_response_model.dart';

part 'api_result_of_enumerable_of_expense_report_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfExpenseReportDto
    implements BaseResponseModel<ExpenseReportDto?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final ExpenseReportDto? data;
  ApiResultOfEnumerableOfExpenseReportDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfEnumerableOfExpenseReportDto.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfExpenseReportDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfExpenseReportDtoToJson(this);
}
