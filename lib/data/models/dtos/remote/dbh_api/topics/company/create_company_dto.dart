import 'package:json_annotation/json_annotation.dart';

part 'create_company_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateCompanyDto {
  final String name;
  final String iban;
  final String adress;
  final String executive;
  final String taxNo;
  final String taxAdmin;
  final String? attachment;
  CreateCompanyDto({
    required this.name,
    required this.iban,
    required this.adress,
    required this.executive,
    required this.taxNo,
    required this.taxAdmin,
    this.attachment,
  });
  factory CreateCompanyDto.fromJson(Map<String, dynamic> json) =>
      _$CreateCompanyDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateCompanyDtoToJson(this);
}
