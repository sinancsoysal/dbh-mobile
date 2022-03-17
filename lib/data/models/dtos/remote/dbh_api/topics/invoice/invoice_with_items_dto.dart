import 'package:json_annotation/json_annotation.dart';

import 'invoice_item_dto.dart';

part 'invoice_with_items_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class InvoiceWithItemsDto {
  InvoiceWithItemsDto({
    required this.id,
    required this.issuingCompanyName,
    required this.companyName,
    required this.invoiceNo,
    required this.description,
    required this.invoiceDate,
    required this.items,
  });

  factory InvoiceWithItemsDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceWithItemsDtoFromJson(json);

  String companyName;
  String description;
  String id;
  String invoiceDate;
  String invoiceNo;
  String issuingCompanyName;
  List<InvoiceItemDto> items;

  Map<String, dynamic> toJson() => _$InvoiceWithItemsDtoToJson(this);
}
