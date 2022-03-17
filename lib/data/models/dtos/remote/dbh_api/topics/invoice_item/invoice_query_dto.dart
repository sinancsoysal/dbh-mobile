import 'package:json_annotation/json_annotation.dart';

part 'invoice_query_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class InvoiceQueryDto {
  final String? expenseItemId;
  final String issuingCompanyName;
  final String companyName;

  final String? fromDate;
  final String? toDate;
  InvoiceQueryDto({
    this.expenseItemId,
    required this.issuingCompanyName,
    required this.companyName,
    this.fromDate,
    this.toDate,
  });
  factory InvoiceQueryDto.fromJson(Map<String, dynamic> json) =>
      _$InvoiceQueryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceQueryDtoToJson(this);
}
