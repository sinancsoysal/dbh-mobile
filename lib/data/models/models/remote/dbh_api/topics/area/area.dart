import 'package:json_annotation/json_annotation.dart';

import '../company/company.dart';
import '../invoice/invoice.dart';
import '../main_expense/main_expense.dart';

part 'area.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Area {
  final String id;
  final String createdDate;
  final String modifiedDate;
  final String? title;
  final String? image;
  final List<Company>? company;
  final List<Invoice>? invoice;
  final List<MainExpense>? mainExpense;
  Area({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    this.title,
    this.image,
    this.company,
    this.invoice,
    this.mainExpense,
  });
  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
