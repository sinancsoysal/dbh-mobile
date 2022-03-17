import 'package:json_annotation/json_annotation.dart';

import '../../../../base_response_model.dart';
import 'invoice_item.dart';

part 'api_result_of_enumerable_of_invoice_item.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfInvoiceItem
    implements BaseResponseModel<List<InvoiceItem>?> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<InvoiceItem>? data;
  ApiResultOfEnumerableOfInvoiceItem({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfEnumerableOfInvoiceItem.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfInvoiceItemFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfInvoiceItemToJson(this);
}
