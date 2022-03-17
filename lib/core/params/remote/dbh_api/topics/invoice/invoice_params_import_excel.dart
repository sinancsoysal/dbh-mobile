import 'dart:io';

class InvoiceParamsImportExcel {
  final String bearerToken;
  final File file;
  InvoiceParamsImportExcel({
    required this.bearerToken,
    required this.file,
  });
}
