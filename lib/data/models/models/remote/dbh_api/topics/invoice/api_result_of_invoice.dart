import 'package:json_annotation/json_annotation.dart';

import '../../../../base_response_model.dart';
import 'invoice.dart';

part 'api_result_of_invoice.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfInvoice implements BaseResponseModel<Invoice> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final Invoice? data;
  ApiResultOfInvoice({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfInvoice.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfInvoiceFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfInvoiceToJson(this);
}
