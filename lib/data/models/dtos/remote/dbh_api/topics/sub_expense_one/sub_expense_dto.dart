import 'package:json_annotation/json_annotation.dart';
part 'sub_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class SubExpenseDto {
  final String? mainExpenseId;
  final String title;
  SubExpenseDto({
    this.mainExpenseId,
    required this.title,
  });

  factory SubExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$SubExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubExpenseDtoToJson(this);
}
