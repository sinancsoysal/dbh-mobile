import 'package:json_annotation/json_annotation.dart';

part 'create_role_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateRoleDto {
  final String? name;
  final bool? invoice;
  final bool? expenseItem;
  final bool? report;
  final bool? query;
  final bool? settings;
  final bool? excelImport;
  CreateRoleDto({
    this.name,
    this.invoice,
    this.expenseItem,
    this.report,
    this.query,
    this.settings,
    this.excelImport,
  });
  factory CreateRoleDto.fromJson(Map<String, dynamic> json) =>
      _$CreateRoleDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoleDtoToJson(this);
}
