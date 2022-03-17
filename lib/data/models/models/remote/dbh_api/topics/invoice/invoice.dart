import 'package:json_annotation/json_annotation.dart';

part 'invoice.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Invoice {
  final String id;
  final String? issuingCompanyName;
  final String? companyName;
  final String? invoiceNo;
  final String? description;
  Invoice({
    required this.id,
    this.issuingCompanyName,
    this.companyName,
    this.invoiceNo,
    this.description,
  });
  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
