import 'package:json_annotation/json_annotation.dart';

import '../area/area.dart';
import '../invoice_item/invoice_item.dart';
import '../sub_expense/sub_expense.dart';
part 'main_expense.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class MainExpense {
  final String id;
  final String createdDate;
  final String modifiedDate;
  final String areaId;
  final Area? area;
  final String? title;
  final List<InvoiceItem>? invoiceItem;
  final List<SubExpense>? subExpense;
  MainExpense({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.areaId,
    this.area,
    this.title,
    this.invoiceItem,
    this.subExpense,
  });
  factory MainExpense.fromJson(Map<String, dynamic> json) =>
      _$MainExpenseFromJson(json);

  Map<String, dynamic> toJson() => _$MainExpenseToJson(this);
}
