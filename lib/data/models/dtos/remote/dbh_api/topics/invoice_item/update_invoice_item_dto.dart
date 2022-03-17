import 'package:json_annotation/json_annotation.dart';

part 'update_invoice_item_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UpdateInvoiceItemDto {
  final String? invoiceId;
  final String? id;
  final double? vat;
  final double? selectableVat;
  final double? quantity;
  final double? price;
  final double? totalPrice;
  final double? withHolding;
  final int? invoiceType;
  final int? unitType;
  final String? attechment;
  final String expenseItemId;
  UpdateInvoiceItemDto({
    this.invoiceId,
    this.id,
    this.vat,
    this.selectableVat,
    this.quantity,
    this.price,
    this.totalPrice,
    this.withHolding,
    this.invoiceType,
    this.unitType,
    this.attechment,
    required this.expenseItemId,
  });
  factory UpdateInvoiceItemDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateInvoiceItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInvoiceItemDtoToJson(this);
}
