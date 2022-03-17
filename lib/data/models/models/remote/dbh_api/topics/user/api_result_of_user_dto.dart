// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mobile/data/models/dtos/remote/dbh_api/topics/settings/user_dto.dart';
import 'package:mobile/data/models/models/base_response_model.dart';

part 'api_result_of_user_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfUserDto implements BaseResponseModel<UserDto?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final UserDto? data;
  ApiResultOfUserDto({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfUserDto.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfUserDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfUserDtoToJson(this);
}
