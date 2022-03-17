import 'base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_result_of_string.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfString implements BaseResponseModel<String?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final String? data;
  ApiResultOfString({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfString.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfStringFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfStringToJson(this);
}
