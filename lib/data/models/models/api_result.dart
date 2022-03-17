import 'base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_result.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResult implements BaseResponseModel {
  @override
  final bool isSuccess;
  @override
  final List<String>? errors;
  @override
  final String statusCode;
  ApiResult({
    required this.isSuccess,
    this.errors,
    required this.statusCode,
  });
  factory ApiResult.fromJson(Map<String, dynamic> json) =>
      _$ApiResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultToJson(this);

  @override
  get data => throw UnimplementedError();
}
