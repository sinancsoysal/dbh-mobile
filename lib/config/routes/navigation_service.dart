import 'i_navigations_service.dart';
import 'package:flutter/material.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();

  static NavigationService get instance => _instance;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  removeAllOldRoutes() => (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage<T extends Object?>(
      {required String path, T? data}) async {
    await navigatorKey.currentState?.pushNamed(
      path,
      arguments: data,
    );
  }

  @override
  Future<void> navigateToPageClear<T extends Object?>(
      {required String path, T? data}) async {
    await navigatorKey.currentState?.pushNamedAndRemoveUntil(
      path,
      removeAllOldRoutes(),
      arguments: data,
    );
  }
}
