import 'package:json_annotation/json_annotation.dart';

import '../../../../../dtos/remote/dbh_api/topics/activity_log/activity_log_dto.dart';
import '../../../../base_response_model.dart';
part 'api_result_of_enumerable_of_activity_log_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfActivityLogDto
    implements BaseResponseModel<List<ActivityLogDto>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<ActivityLogDto>? data;
  ApiResultOfEnumerableOfActivityLogDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfEnumerableOfActivityLogDto.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfActivityLogDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfActivityLogDtoToJson(this);
}
