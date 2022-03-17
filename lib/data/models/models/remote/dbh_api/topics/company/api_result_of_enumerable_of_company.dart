// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mobile/data/models/models/base_response_model.dart';
import 'package:mobile/data/models/models/remote/dbh_api/topics/company/company.dart';

part 'api_result_of_enumerable_of_company.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfCompany
    implements BaseResponseModel<List<Company>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<Company>? data;
  ApiResultOfEnumerableOfCompany({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfEnumerableOfCompany.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfCompanyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfEnumerableOfCompanyToJson(this);
}
