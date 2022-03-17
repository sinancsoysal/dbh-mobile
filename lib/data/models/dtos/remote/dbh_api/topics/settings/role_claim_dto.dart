import 'package:json_annotation/json_annotation.dart';
part 'role_claim_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RoleClaimDto {
  final String id;
  final String name;
  final bool company;
  final bool invoice;
  final bool expenseItem;
  final bool report;
  final bool query;
  final bool settings;
  final bool excelImport;
  RoleClaimDto({
    required this.id,
    required this.name,
    required this.company,
    required this.invoice,
    required this.expenseItem,
    required this.report,
    required this.query,
    required this.settings,
    required this.excelImport,
  });
  factory RoleClaimDto.fromJson(Map<String, dynamic> json) =>
      _$RoleClaimDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RoleClaimDtoToJson(this);
}
