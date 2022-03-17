import 'dart:io';
import 'package:flutter/material.dart' show debugPrint;
import 'package:fluttertoast/fluttertoast.dart';

import 'dio_refresh_authentication_retrier.dart';
import 'package:dio/dio.dart';

import 'dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  late final DioConnectivityRequestRetrier requestRetrier;
  late final DioRefreshAuthenticationRetrier refreshAuthenticationRetrier;
  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
    required this.refreshAuthenticationRetrier,
  });
  @override
  Future onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint("errorOn, retryInterceptor: ${err.toString()}");

    if(_isDeviceNetworkIsNotActive(err)){
      try{
        debugPrint("Error: Device connection is not active!");
        Fluttertoast.showToast(
            msg: "Check the device network connection!",
            toastLength: Toast.LENGTH_SHORT
        );
      }catch(e){
        return e;
      }
    }else if (_shouldRetryConnection(err)) {
      try {
        return requestRetrier.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }else if (_shouldRetryRefreshToken(err)) {
      try {
        return refreshAuthenticationRetrier
            .scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }

    return err;
  }

  bool _shouldRetryConnection(DioError err) {
    return err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException;
  }

  bool _shouldRetryRefreshToken(DioError err) {
    return err.type == DioErrorType.response &&
        err.error != null &&
        err.response?.statusCode == 401;
  }


  bool _isDeviceNetworkIsNotActive(DioError err){
    return (err.type == DioErrorType.other &&
        err.error != null &&
        err.error is SocketException) && err.toString().contains(
      "Failed host lookup"
    );
  }
}
