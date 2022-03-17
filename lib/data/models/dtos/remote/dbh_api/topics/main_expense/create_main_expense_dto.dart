import 'package:json_annotation/json_annotation.dart';

part 'create_main_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateMainExpenseDto {
  final String title;
  CreateMainExpenseDto({
    required this.title,
  });
  factory CreateMainExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$CreateMainExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateMainExpenseDtoToJson(this);
}
