import 'main_expense_most_used_dto.dart';
import '../../../../../models/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_result_of_enumerable_of_main_expense_most_used_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfMainExpenseMostUsedDto
    implements BaseResponseModel<List<MainExpenseMostUsedDto>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<MainExpenseMostUsedDto>? data;
  factory ApiResultOfEnumerableOfMainExpenseMostUsedDto.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfMainExpenseMostUsedDtoFromJson(json);

  ApiResultOfEnumerableOfMainExpenseMostUsedDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfMainExpenseMostUsedDtoToJson(this);
}
