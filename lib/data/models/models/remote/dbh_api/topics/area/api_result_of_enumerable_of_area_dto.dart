import 'package:json_annotation/json_annotation.dart';

import '../../../../../dtos/remote/dbh_api/topics/area/area_dto.dart';
import '../../../../base_response_model.dart';

part 'api_result_of_enumerable_of_area_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfAreaDto
    implements BaseResponseModel<List<AreaDto>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<AreaDto>? data;
  ApiResultOfEnumerableOfAreaDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfEnumerableOfAreaDto.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfAreaDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfEnumerableOfAreaDtoToJson(this);
}
