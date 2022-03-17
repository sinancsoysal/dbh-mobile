import '../../../../base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_result.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AuthResult implements BaseResponseModel {
  final String? refreshToken;
  final String? token;
  final String? userId;
  @override
  final dynamic data;
  @override
  final List<String>? errors;
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  AuthResult({
    this.refreshToken,
    this.token,
    this.userId,
    required this.data,
    this.errors,
    required this.isSuccess,
    required this.statusCode,
  });
  factory AuthResult.fromJson(Map<String, dynamic> json) =>
      _$AuthResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AuthResultToJson(this);
}
