import 'package:json_annotation/json_annotation.dart';
part 'create_invoice_item_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateInvoiceItemDto {
  final String? invoiceId;
  final String? vat;
  final String? selectableVat;
  final String? quantity;
  final String? price;
  final String? totalPrice;
  final String? withHolding;
  final int invoiceType;
  final int unitType;
  final String? attechment;
  final String? expenseItemId;
  CreateInvoiceItemDto({
    this.invoiceId,
    this.vat,
    this.selectableVat,
    this.quantity,
    this.price,
    this.totalPrice,
    this.withHolding,
    required this.invoiceType,
    required this.unitType,
    this.attechment,
    this.expenseItemId,
  });
  factory CreateInvoiceItemDto.fromJson(Map<String, dynamic> json) =>
      _$CreateInvoiceItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateInvoiceItemDtoToJson(this);
}
