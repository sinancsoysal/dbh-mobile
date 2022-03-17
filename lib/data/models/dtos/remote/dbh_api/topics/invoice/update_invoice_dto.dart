import 'package:json_annotation/json_annotation.dart';

part 'update_invoice_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UpdateInvoiceDto {
  final String? id;
  final String issuingCompanyName;
  final String companyName;
  final String invoiceNo;
  final String descrption;
  UpdateInvoiceDto({
    this.id,
    required this.issuingCompanyName,
    required this.companyName,
    required this.invoiceNo,
    required this.descrption,
  });
  factory UpdateInvoiceDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateInvoiceDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateInvoiceDtoToJson(this);
}
