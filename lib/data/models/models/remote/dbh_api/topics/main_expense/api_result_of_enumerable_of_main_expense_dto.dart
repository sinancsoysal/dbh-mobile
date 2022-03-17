import 'package:json_annotation/json_annotation.dart';

import '../../../../../dtos/remote/dbh_api/topics/main_expense/main_expense_dto.dart';
import '../../../../base_response_model.dart';

part 'api_result_of_enumerable_of_main_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfMainExpenseDto
    implements BaseResponseModel<MainExpenseDto> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final MainExpenseDto? data;
  ApiResultOfEnumerableOfMainExpenseDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfEnumerableOfMainExpenseDto.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfMainExpenseDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfMainExpenseDtoToJson(this);
}
