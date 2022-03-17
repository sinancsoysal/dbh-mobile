typedef ConditionOperator = Function();
typedef ConditionValueOperator<T> = Function(T?);

abstract class UseCase<T, P> {
  Future<T> call({required P params});
}

abstract class UseCaseWithOperators<T, P> {
  Future<T> call({
    required P params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<T>? onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  });
}
