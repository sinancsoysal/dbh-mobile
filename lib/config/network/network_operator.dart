import '../routes/navigation_routes.dart';
import '../routes/navigation_service.dart';
import '../../data/data_sources/local/preferences_manager.dart';

import '../../core/resources/use_case.dart';

import '../../core/resources/data_state.dart';
import '../../core/resources/network_operator.dart';
import '../../data/models/models/base_response_model.dart';
import '../../data/models/type_parameters/api_result_status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

class NetworkOperator<T extends BaseResponseModel>
    implements INetworkOperator<T> {
  NetworkOperator({
    required this.requestFunction,
    this.onFail,
    this.onSuccess,
    this.onAuthorizationFail,
  });

  @override
  final ConditionOperator? onAuthorizationFail;

  @override
  final ConditionValueOperator<List<String>>? onFail;

  @override
  final ConditionValueOperator<DataState<T>>? onSuccess;

  @override
  final Future<HttpResponse<T>> requestFunction;

  @override
  Future<DataState<T>?> request() async {
    try {
      final HttpResponse<T> httpResponse = await requestFunction;
      final String statusCode = httpResponse.data.statusCode;

      switch (statusCode.toApiResultStatusCode) {
        case ApiResultStatusCode.success:
          await executeConditionOperator(
            onSuccess,
            args: OperationSuccess(httpResponse.data),
          );
          return OperationSuccess(httpResponse.data);

        case ApiResultStatusCode.unAuthorized:
          await executeConditionOperator(onAuthorizationFail);
          return OperationFailed.fromResponse(
            response: httpResponse.response,
            message: httpResponse.data.errors,
            code: httpResponse.data.statusCode,
          );

        default:
          await executeConditionOperator(onFail,
              args: httpResponse.data.errors);
          return OperationFailed.fromResponse(
            response: httpResponse.response,
            message: httpResponse.data.errors,
            code: httpResponse.data.statusCode,
          );
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        NavigationService.instance
            .navigateToPageClear(path: NavigationConstants.loginView);
        PreferencesManager.instance.clearAllSaveFirst();
        await executeConditionOperator(onAuthorizationFail);
      } else {
        if (e.response?.data is Map) {
          try {
            var x = e.response?.data?["Errors"] as List<dynamic>;
            List<String> y = [];
            y.addAll(x.map((e) => e.toString()));

            await executeConditionOperator(
              onFail,
              args: y,
            );
          } catch (_) {}
        }
      }
      debugPrint("${T.toString()} Dio error catched : ${e.message}");
      return OperationFailed.fromDioError(e);
    }
  }

  Future<void> executeConditionOperator(Function? operator,
      {dynamic args}) async {
    if (operator != null) {
      try {
        if (args != null) {
          await operator(args);
        } else {
          await operator();
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
}
