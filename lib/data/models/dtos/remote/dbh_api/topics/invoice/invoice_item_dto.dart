import 'package:json_annotation/json_annotation.dart';
part 'invoice_item_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class InvoiceItemDto {
  String id;
  double? vat;
  double? selectableVat;
  double? quantity;
  double? discount;
  double price;
  double totalPrice;
  String? formattedPrice;
  String? formattedUnitPrice;
  String? formattedTotalPrice;
  String? formattedVat;
  String? formattedSelectableVat;
  double withHolding;
  String invoiceType;
  int invoiceTypeIndex;
  String unitType;
  int unitTypeIndex;
  String expenseItemType;
  int expenseItemTypeIndex;
  String? attachment;
  String invoiceItemId;
  String mainExpenseId;
  String? mainExpenseTitle;
  String? subExpenseId;
  String? subExpenseTitle;
  String? description;
  InvoiceItemDto({
    required this.id,
    this.vat,
    this.selectableVat,
    this.quantity,
    this.discount,
    required this.price,
    required this.totalPrice,
    required this.withHolding,
    required this.invoiceType,
    required this.invoiceTypeIndex,
    required this.unitType,
    required this.unitTypeIndex,
    required this.expenseItemType,
    required this.expenseItemTypeIndex,
    this.attachment,
    required this.invoiceItemId,
    required this.mainExpenseId,
    this.mainExpenseTitle,
    this.subExpenseId,
    this.subExpenseTitle,
    this.description,
    this.formattedPrice,
    this.formattedUnitPrice,
    this.formattedTotalPrice,
    this.formattedVat,
    this.formattedSelectableVat,
  });
  factory InvoiceItemDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceItemDtoToJson(this);
}
