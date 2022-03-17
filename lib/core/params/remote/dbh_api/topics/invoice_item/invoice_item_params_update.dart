import '../../../../../../data/models/dtos/remote/dbh_api/topics/invoice_item/update_invoice_item_dto.dart';

class InvoiceItemParamsUpdate {
  final String bearerToken;
  final UpdateInvoiceItemDto updateInvoiceItemDto;
  InvoiceItemParamsUpdate({
    required this.bearerToken,
    required this.updateInvoiceItemDto,
  });
}
