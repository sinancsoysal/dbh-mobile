import 'package:json_annotation/json_annotation.dart';

import '../invoice_item/create_invoice_item_dto.dart';

part 'create_invoice_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateInvoiceDto {
  final String issuingCompanyName;
  final String companyName;
  final String invoiceNo;
  final String description;
  final List<CreateInvoiceItemDto>? items;
  CreateInvoiceDto({
    required this.issuingCompanyName,
    required this.companyName,
    required this.invoiceNo,
    required this.description,
    this.items,
  });
  factory CreateInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceDtoToJson(this);
}
