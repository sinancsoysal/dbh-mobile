import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? value;
  final DioError? error;
  final List<String>? message;
  final String? code;

  const DataState({this.code, this.message, this.value, this.error});
}

class OperationSuccess<T> extends DataState<T> {
  const OperationSuccess(T data) : super(value: data);
}

class OperationFailed<T> extends DataState<T> {
  const OperationFailed(T data) : super(value: data);

  OperationFailed.fromResponse(
      {Response? response, List<String>? message, String? code})
      : super(
          code: code,
          message: message,
          error: DioError(
            error: response?.statusMessage,
            response: response,
            type: DioErrorType.response,
            requestOptions: RequestOptions(path: ""),
          ),
        );
  const OperationFailed.fromDioError(DioError error) : super(error: error);
}
//TODO: CHECK REQUEST OPTIONS IF IT IS WORKING PROPERLY