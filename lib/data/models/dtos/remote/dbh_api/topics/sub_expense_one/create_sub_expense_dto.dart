import 'package:json_annotation/json_annotation.dart';

part 'create_sub_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateSubExpenseDto {
  final String? mainExpenseId;
  final String title;
  CreateSubExpenseDto({
    this.mainExpenseId,
    required this.title,
  });
  factory CreateSubExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateSubExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateSubExpenseDtoToJson(this);
}
