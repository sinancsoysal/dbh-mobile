import 'package:json_annotation/json_annotation.dart';

part 'main_expense_comparasion.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class MainExpenseComparison {
  final String title;
  final double currentMonthTotalPrice;
  final double previousMonthTotalPrice;
  MainExpenseComparison({
    required this.title,
    required this.currentMonthTotalPrice,
    required this.previousMonthTotalPrice,
  });

  factory MainExpenseComparison.fromJson(Map<String, dynamic> json) =>
      _$MainExpenseComparisonFromJson(json);

  Map<String, dynamic> toJson() => _$MainExpenseComparisonToJson(this);
}
