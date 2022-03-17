import 'dart:io';

import '../../../../../../core/params/remote/dbh_api/topics/invoice/invoice_params_export_excel.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';

class InvoiceExportExcelUseCase
    implements UseCase<DataState<File>?, InvoiceParamsExportExcell> {
  final InvoiceRepository _invoiceRepository;

  InvoiceExportExcelUseCase(this._invoiceRepository);

  @override
  Future<DataState<File>?> call({required InvoiceParamsExportExcell params}) =>
      _invoiceRepository.exportExcel(params: params);
}
