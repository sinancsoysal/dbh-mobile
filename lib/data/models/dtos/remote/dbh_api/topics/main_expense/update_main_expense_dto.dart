import 'package:json_annotation/json_annotation.dart';
part 'update_main_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UpdateMainExpenseDto {
  final String id;
  final String title;
  UpdateMainExpenseDto({
    required this.id,
    required this.title,
  });
  factory UpdateMainExpenseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateMainExpenseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateMainExpenseDtoToJson(this);
}
