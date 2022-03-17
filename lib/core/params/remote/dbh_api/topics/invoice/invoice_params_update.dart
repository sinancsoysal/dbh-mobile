import '../../../../../../data/models/dtos/remote/dbh_api/topics/invoice/update_invoice_dto.dart';

class InvoiceParamsUpdate {
  final String bearerToken;
  final String xArea;
  final UpdateInvoiceDto updateInvoiceDto;
  InvoiceParamsUpdate({
    required this.bearerToken,
    required this.updateInvoiceDto,
    required this.xArea,
  });
}
