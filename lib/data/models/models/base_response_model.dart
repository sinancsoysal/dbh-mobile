// ignore_for_file: non_constant_identifier_names

abstract class BaseResponseModel<T> {
  final bool isSuccess;
  final String statusCode;
  final List<String>? errors;
  final T? data;
  Map<String, dynamic> toJson();
  BaseResponseModel(this.isSuccess, this.statusCode, this.errors, this.data);
}
