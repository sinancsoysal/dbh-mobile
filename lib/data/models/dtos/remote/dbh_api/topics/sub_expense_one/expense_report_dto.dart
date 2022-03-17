import 'package:json_annotation/json_annotation.dart';

part 'expense_report_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ExpenseReportDto {
  final String? mainExpenseId;
  final String? subExpens1Id;
  final String? mainExpenseTitle;
  final String? subExense1Title;
  ExpenseReportDto({
    this.mainExpenseId,
    this.subExpens1Id,
    this.mainExpenseTitle,
    this.subExense1Title,
  });
  factory ExpenseReportDto.fromJson(Map<String, dynamic> json) =>
      _$ExpenseReportDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseReportDtoToJson(this);
}
