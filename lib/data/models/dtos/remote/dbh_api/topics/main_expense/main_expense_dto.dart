import 'package:json_annotation/json_annotation.dart';

part 'main_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class MainExpenseDto {
  final String id;
  final String title;
  MainExpenseDto({
    required this.id,
    required this.title,
  });
  factory MainExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$MainExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainExpenseDtoToJson(this);
}
