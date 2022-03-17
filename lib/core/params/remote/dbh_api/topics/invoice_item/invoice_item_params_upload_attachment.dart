import 'dart:io';

class InvoiceItemParamsUploadAttachment {
  final String bearerToken;
  final File file;
  InvoiceItemParamsUploadAttachment({
    required this.bearerToken,
    required this.file,
  });
}
