// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

import 'package:mobile/data/models/models/base_response_model.dart';
import 'package:mobile/data/models/models/remote/dbh_api/topics/invoice/invoice.dart';

part 'api_result_of_enumerable_of_invoice.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfInvoice
    implements BaseResponseModel<List<Invoice>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<Invoice>? data;
  ApiResultOfEnumerableOfInvoice({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });

  factory ApiResultOfEnumerableOfInvoice.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfInvoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfEnumerableOfInvoiceToJson(this);
}
