import '../../../../../../data/models/dtos/remote/dbh_api/topics/invoice/create_invoice_dto.dart';

class InvoiceParamsCreate {
  final String bearerToken;
  final String xArea;

  final CreateInvoiceDto createInvoiceDto;
  InvoiceParamsCreate({
    required this.bearerToken,
    required this.createInvoiceDto,
    required this.xArea,
  });
}
