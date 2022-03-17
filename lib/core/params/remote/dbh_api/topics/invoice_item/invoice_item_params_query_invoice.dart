import '../../../../../../data/models/dtos/remote/dbh_api/topics/invoice_item/invoice_query_dto.dart';

class InvoiceItemParamsQueryByInvoice {
  final String bearerToken;
  final InvoiceQueryDto invoiceQueryDto;
  InvoiceItemParamsQueryByInvoice({
    required this.bearerToken,
    required this.invoiceQueryDto,
  });
}
