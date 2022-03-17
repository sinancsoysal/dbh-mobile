import 'package:json_annotation/json_annotation.dart';

import '../../../../base_response_model.dart';
import 'company.dart';

part 'api_result_of_company.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfCompany implements BaseResponseModel<Company> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final Company? data;
  ApiResultOfCompany({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfCompany.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfCompanyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfCompanyToJson(this);
}
