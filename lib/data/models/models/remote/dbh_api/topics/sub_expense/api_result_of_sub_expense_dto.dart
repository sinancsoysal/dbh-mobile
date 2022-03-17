import '../../../../../dtos/remote/dbh_api/topics/sub_expense_one/sub_expense_dto.dart';

import '../../../../base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_result_of_sub_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfSubExpenseDto implements BaseResponseModel<SubExpenseDto?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final SubExpenseDto? data;
  ApiResultOfSubExpenseDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfSubExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfSubExpenseDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfSubExpenseDtoToJson(this);
}
