// ignore_for_file: constant_identifier_names

enum InvoiceType {
  Leasing,
  Sales,
  BasicInvoice,
  Projection,
  WithHolding,
}

extension InvoiceTypeToNumber on InvoiceType {
  int get toInt {
    switch (this) {
      case InvoiceType.Leasing:
        return 0;
      case InvoiceType.Sales:
        return 1;
      case InvoiceType.BasicInvoice:
        return 2;
      case InvoiceType.Projection:
        return 3;
      case InvoiceType.WithHolding:
        return 4;
    }
  }
}
