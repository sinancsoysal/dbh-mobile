import 'package:json_annotation/json_annotation.dart';

import '../area/area.dart';

part 'company.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Company {
  final String id;
  final String createdDate;
  final String modifiedDate;
  final String areaId;
  final Area area;
  final String? name;
  final String? address;
  final String? executive;
  final String? tel;
  final String? taxNo;
  final String? taxAdmin;
  final String? attachment;

  Company({
    required this.id,
    required this.createdDate,
    required this.modifiedDate,
    required this.areaId,
    required this.area,
    this.name,
    this.address,
    this.executive,
    this.tel,
    this.taxNo,
    this.taxAdmin,
    this.attachment,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
