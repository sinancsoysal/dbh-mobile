import 'package:json_annotation/json_annotation.dart';

import '../invoice/invoice.dart';
import '../main_expense/main_expense.dart';
import '../sub_expense/sub_expense.dart';

part 'invoice_item.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class InvoiceItem {
  final String id;
  final String createdDate;
  final String modifiedDate;
  final double? vat;
  final bool? selectableVat;
  final double? quantity;
  final double? discount;
  final double price;
  final double totalPrice;
  final double withHolding;
  final int invoiceType;
  final int unitType;
  final int expenseItemType;
  final String? attachment;
  final String mainExpenseId;
  final String? subExpenseId;
  final String invoiceId;
  final MainExpense? mainExpense;
  final SubExpense? subExpense;
  final Invoice? invoice;
  InvoiceItem({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    this.vat,
    this.selectableVat,
    this.quantity,
    this.discount,
    required this.price,
    required this.totalPrice,
    required this.withHolding,
    required this.invoiceType,
    required this.unitType,
    required this.expenseItemType,
    this.attachment,
    required this.mainExpenseId,
    this.subExpenseId,
    required this.invoiceId,
    this.mainExpense,
    this.subExpense,
    this.invoice,
  });
  factory InvoiceItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceItemToJson(this);
}
