import 'activity_log_with_detail_dto.dart';
import '../../../../../models/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_result_of_enumerable_of_activity_log_with_detail_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfActivityLogWithDetailDto
    implements BaseResponseModel<List<ActivityLogWithDetailDto>> {
  @override
  final List<ActivityLogWithDetailDto>? data;
  @override
  final List<String>? errors;
  @override
  final bool isSuccess;
  @override
  final String statusCode;

  ApiResultOfEnumerableOfActivityLogWithDetailDto({
    this.data,
    this.errors,
    required this.isSuccess,
    required this.statusCode,
  });

  factory ApiResultOfEnumerableOfActivityLogWithDetailDto.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfActivityLogWithDetailDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfActivityLogWithDetailDtoToJson(this);
}
