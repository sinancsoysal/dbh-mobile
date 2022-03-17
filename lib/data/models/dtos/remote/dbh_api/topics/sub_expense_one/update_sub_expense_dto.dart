import 'package:json_annotation/json_annotation.dart';

part 'update_sub_expense_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UpdateSubExpense1Dto {
  final String? id;
  final String title;
  UpdateSubExpense1Dto({
    this.id,
    required this.title,
  });

  factory UpdateSubExpense1Dto.fromJson(Map<String, dynamic> json) =>
      _$UpdateSubExpense1DtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateSubExpense1DtoToJson(this);
}
