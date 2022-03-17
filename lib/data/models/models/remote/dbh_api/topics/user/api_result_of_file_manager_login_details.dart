// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mobile/data/models/dtos/remote/dbh_api/topics/user/file_manager_login_dto.dart';
import 'package:mobile/data/models/models/base_response_model.dart';

part 'api_result_of_file_manager_login_details.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfFileManagerLoginDetails implements BaseResponseModel<FileManagerLoginDto?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final FileManagerLoginDto? data;
  ApiResultOfFileManagerLoginDetails({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfFileManagerLoginDetails.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfFileManagerLoginDetailsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfFileManagerLoginDetailsToJson(this);
}
