import 'package:json_annotation/json_annotation.dart';

import '../../../../base_response_model.dart';
import 'area.dart';
part 'api_result_of_area.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfArea implements BaseResponseModel<Area?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final Area? data;
  ApiResultOfArea({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfArea.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfAreaFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfAreaToJson(this);
}
