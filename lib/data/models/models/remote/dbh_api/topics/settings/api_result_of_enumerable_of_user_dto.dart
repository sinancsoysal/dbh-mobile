import 'package:json_annotation/json_annotation.dart';

import '../../../../../dtos/remote/dbh_api/topics/settings/user_dto.dart';
import '../../../../base_response_model.dart';

part 'api_result_of_enumerable_of_user_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfUserDto
    implements BaseResponseModel<List<UserDto>?> {
  @override
  final List<String>? errors;

  @override
  final bool isSuccess;

  @override
  final String statusCode;
  @override
  final List<UserDto>? data;
  ApiResultOfEnumerableOfUserDto({
    this.errors,
    required this.isSuccess,
    required this.statusCode,
    this.data,
  });
  factory ApiResultOfEnumerableOfUserDto.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfUserDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfEnumerableOfUserDtoToJson(this);
}
