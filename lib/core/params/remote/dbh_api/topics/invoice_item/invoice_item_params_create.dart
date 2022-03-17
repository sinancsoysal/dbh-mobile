import '../../../../../../data/models/dtos/remote/dbh_api/topics/invoice_item/create_invoice_item_dto.dart';

class InvoiceItemParamsCreate {
  final String bearerToken;
  final CreateInvoiceItemDto createInvoiceItemDto;
  InvoiceItemParamsCreate({
    required this.bearerToken,
    required this.createInvoiceItemDto,
  });
}
