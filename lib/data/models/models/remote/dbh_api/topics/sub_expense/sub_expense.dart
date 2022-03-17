import 'package:json_annotation/json_annotation.dart';

import '../invoice_item/invoice_item.dart';
import '../main_expense/main_expense.dart';

part 'sub_expense.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class SubExpense {
  final String id;
  final String createdTime;
  final String modifiedDate;
  final String? title;
  final String mainExpenseId;
  final MainExpense? mainExpense;
  final List<InvoiceItem>? invoiceItem;
  SubExpense({
    required this.id,
    required this.createdTime,
    required this.modifiedDate,
    this.title,
    required this.mainExpenseId,
    this.mainExpense,
    this.invoiceItem,
  });
  factory SubExpense.fromJson(Map<String, dynamic> json) =>
      _$SubExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$SubExpenseToJson(this);
}
