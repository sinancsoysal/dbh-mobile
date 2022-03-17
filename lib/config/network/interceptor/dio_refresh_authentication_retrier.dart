import 'dart:async';

import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';

import '../../../data/data_sources/local/preferences_manager.dart';
import '../../../data/data_sources/remote/dbh_api/topics/user/user_service.dart';
import '../../../data/models/models/remote/dbh_api/topics/user/auth_result.dart';
import '../../../data/models/models/remote/dbh_api/topics/user/refresh_token_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

class DioRefreshAuthenticationRetrier {
  final Dio dio;
  DioRefreshAuthenticationRetrier({
    required this.dio,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    final String bearerToken =
        PreferencesManager.instance.getStringValue(PreferencesKeys.token);
    final String refreshToken = PreferencesManager.instance
        .getStringValue(PreferencesKeys.refreshToken);

    final HttpResponse<AuthResult> response = await UserService(Dio())
        .refreshToken(
            bearerToken: bearerToken,
            refreshTokenRequest:
                RefreshTokenRequest(bearerToken, refreshToken));

    if (response.data.token != null) {
      PreferencesManager.instance.setStringValue(
        PreferencesKeys.token,
        response.data.token!,
      );
    }
    if (response.data.refreshToken != null) {
      PreferencesManager.instance.setStringValue(
        PreferencesKeys.refreshToken,
        response.data.refreshToken!,
      );

      response.response.requestOptions.headers
          .update(r'Authorization', (value) => response.data.token);
    }

    return dio.request(
      DbhApiRouteConstants.BASE_URL + requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: _requestOptions(requestOptions),
    );
  }

  Options _requestOptions(RequestOptions requestOptions) {
    return Options(
      method: requestOptions.method,
      sendTimeout: requestOptions.sendTimeout,
      receiveTimeout: requestOptions.receiveTimeout,
      extra: requestOptions.extra,
      headers: requestOptions.headers,
      responseType: requestOptions.responseType,
      contentType: requestOptions.contentType,
      validateStatus: requestOptions.validateStatus,
      receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      followRedirects: requestOptions.followRedirects,
      maxRedirects: requestOptions.maxRedirects,
      requestEncoder: requestOptions.requestEncoder,
      responseDecoder: requestOptions.responseDecoder,
      listFormat: requestOptions.listFormat,
    );
  }
}
