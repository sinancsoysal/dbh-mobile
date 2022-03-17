import 'package:mobile/presentation/folder/view/folder_view.dart';

import '../../presentation/invoices/view/invoices_view.dart';
import '../../presentation/profile/view/password/password_view.dart';
import '../../presentation/search/view/search_view.dart';
import '../../presentation/settings/view/settings_sub_views/appearance/appearance_view.dart';
import '../../presentation/settings/view/settings_view.dart';

import '../../domain/usecases/remote/dbh_api/topics/user/user_use_case_register_user.dart';
import '../../presentation/activity_log/view/activity_log.dart';
import '../../presentation/authentication/bloc/register_bloc/bloc_repository_of_register.dart';
import '../../presentation/home_cost_control/view/home_cost_control_view.dart';
import '../../presentation/profile/view/profile_view.dart';

import '../../injector.dart';
import '../../presentation/app_selection_and_location_merged/view/app_selection_and_location_merged_view.dart';
import '../../presentation/authentication/view/login/login_view.dart';
import '../../presentation/authentication/view/register/register_view.dart';

import '../../presentation/onboarding/view/splash_view.dart';

import 'package:flutter/material.dart';

class NavigationRoutes {
  NavigationRoutes._init();

  static final NavigationRoutes _instance = NavigationRoutes._init();

  static NavigationRoutes get instance => _instance;

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NavigationConstants.loginView:
        return normalNavigate(
          view: const LoginView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.registerView:
        return normalNavigate(
          view: RegisterView(
            blocRepositoryOfRegister: BlocRepositoryOfRegister(
              injector<UserRegisterUseCase>(),
            ),
          ),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.appSelectionAndLocationMergedView:
        return normalNavigate(
          view: const AppSelectionAndLocationMergedView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.splashView:
        return normalNavigate(
          view: const SplasView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.profileView:
        return normalNavigate(
          view: const ProfileView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.activityLogView:
        return normalNavigate(
          view: ActivityLogView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.homeCostControlView:
        return normalNavigate(
          view: const HomeCostControlView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.financeView:
        return normalNavigate(
          view: const FolderView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.passwordView:
        return normalNavigate(
          view: const PasswordView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.invoicesView:
        return normalNavigate(
          view: const InvoicesView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.searchView:
        return normalNavigate(
          view: SearchView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.settingsView:
        return normalNavigate(
          view: const SettingsView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      case NavigationConstants.settingsAppearanceView:
        return normalNavigate(
          view: const AppearanceView(),
          arguments: RouteSettings(arguments: settings.arguments),
        );
      default:
        return normalNavigate(
          view: const Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text("Yüklenemedi"),
            ),
          ),
          arguments: RouteSettings(arguments: settings.arguments),
        );
    }
  }

  MaterialPageRoute normalNavigate(
      {required Widget view, RouteSettings? arguments}) {
    return MaterialPageRoute(
      builder: (context) => view,
      settings: RouteSettings(
        name: arguments?.name,
        arguments: arguments?.arguments,
      ),
    );
  }
}

class NavigationConstants {
  static const activityLogView = "/activity_log-view";
  static const appSelectionAndLocationMergedView = "/home-view";
  static const homeCostControlView = "/home-cost-control-view";
  static const financeView = "/finance-view";
  static const loginView = "/login-view";
  static const passwordView = "/password-view";
  static const profileView = "/profile-view";
  static const registerView = "/register-view";
  static const invoicesView = "/invoices-view";
  static const searchView = "/search-view";
  static const settingsView = "/settings-view";
  static const settingsAppearanceView = "/settings-appearance-view";
  static const splashView = "/";
}
