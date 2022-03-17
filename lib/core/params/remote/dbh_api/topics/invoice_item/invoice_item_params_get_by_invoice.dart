class InvoiceItemParamsGetByInvoice {
  final String bearerToken;
  final String? invoiceId;
  InvoiceItemParamsGetByInvoice({
    required this.bearerToken,
    this.invoiceId,
  });
}
