import 'package:json_annotation/json_annotation.dart';
part 'update_company_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UpdateCompanyDto {
  final String id;
  final String name;
  final String iban;
  final String executive;
  final String tel;
  final String taxNo;
  final String taxAdmin;
  final String? attachment;
  UpdateCompanyDto({
    required this.id,
    required this.name,
    required this.iban,
    required this.executive,
    required this.tel,
    required this.taxNo,
    required this.taxAdmin,
    this.attachment,
  });
  factory UpdateCompanyDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateCompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCompanyDtoToJson(this);
}
