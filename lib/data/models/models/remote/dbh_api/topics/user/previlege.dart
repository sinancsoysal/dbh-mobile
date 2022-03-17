import 'package:json_annotation/json_annotation.dart';

part 'previlege.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Privilege {
  final bool? company;
  final bool? invoice;
  final bool? expenseItem;
  final bool? report;
  final bool? query;
  final bool? settings;
  final bool? excelImport;
  Privilege({
    this.company,
    this.invoice,
    this.expenseItem,
    this.report,
    this.query,
    this.settings,
    this.excelImport,
  });
  factory Privilege.fromJson(Map<String, dynamic> json) =>
      _$PrivilegeFromJson(json);

  Map<String, dynamic> toJson() => _$PrivilegeToJson(this);
}
