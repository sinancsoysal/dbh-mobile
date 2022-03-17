import 'use_case.dart';
import 'package:retrofit/retrofit.dart';

import 'data_state.dart';

abstract class INetworkOperator<T> {
  INetworkOperator({
    required this.requestFunction,
    this.onSuccess,
    this.onAuthorizationFail,
    this.onFail,
  });

  final ConditionOperator? onAuthorizationFail;
  final ConditionValueOperator<List<String>>? onFail;
  final ConditionValueOperator<DataState<T>>? onSuccess;
  final Future<HttpResponse<T>> requestFunction;

  Future<DataState<T>?> request();
}
