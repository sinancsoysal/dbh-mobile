import 'invoice_with_items_dto.dart';
import '../../../../../models/base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_result_of_enumerable_of_invoice_with_items_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfEnumerableOfInvoiceWithItemsDto
    implements BaseResponseModel<List<InvoiceWithItemsDto>?> {
  @override
  bool isSuccess;
  @override
  String statusCode;
  @override
  List<String>? errors;
  @override
  List<InvoiceWithItemsDto>? data;

  ApiResultOfEnumerableOfInvoiceWithItemsDto(
      {required this.isSuccess,
      required this.statusCode,
      this.errors,
      this.data});

  factory ApiResultOfEnumerableOfInvoiceWithItemsDto.fromJson(
          Map<String, dynamic> json) =>
      _$ApiResultOfEnumerableOfInvoiceWithItemsDtoFromJson(json);
  @override
  Map<String, dynamic> toJson() =>
      _$ApiResultOfEnumerableOfInvoiceWithItemsDtoToJson(this);
}
