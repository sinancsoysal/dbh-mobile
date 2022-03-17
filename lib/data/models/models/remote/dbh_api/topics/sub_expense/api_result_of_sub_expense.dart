// ignore_for_file: non_constant_identifier_names

import 'package:mobile/data/models/models/remote/dbh_api/topics/invoice_item/invoice_item.dart';

import '../../../../base_response_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_result_of_sub_expense.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResultOfSubExpense implements BaseResponseModel<List<InvoiceItem>> {
  @override
  final bool isSuccess;
  @override
  final String statusCode;
  @override
  final List<String>? errors;
  @override
  final List<InvoiceItem>? data;
  ApiResultOfSubExpense({
    required this.isSuccess,
    required this.statusCode,
    this.errors,
    this.data,
  });
  factory ApiResultOfSubExpense.fromJson(Map<String, dynamic> json) =>
      _$ApiResultOfSubExpenseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ApiResultOfSubExpenseToJson(this);
}
