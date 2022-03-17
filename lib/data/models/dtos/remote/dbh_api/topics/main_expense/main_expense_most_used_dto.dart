import 'package:json_annotation/json_annotation.dart';
part 'main_expense_most_used_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class MainExpenseMostUsedDto {
  final String title;

  final String? grandTotal;

  MainExpenseMostUsedDto({
    required this.title,
    required this.grandTotal,
  });
  factory MainExpenseMostUsedDto.fromJson(Map<String, dynamic> json) =>
      _$MainExpenseMostUsedDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainExpenseMostUsedDtoToJson(this);
}
