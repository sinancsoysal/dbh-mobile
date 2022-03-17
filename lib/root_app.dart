import 'presentation/authentication/bloc/authentication_bloc/authentication_bloc.dart';
import 'presentation/authentication/bloc/authentication_bloc/authentication_repository.dart';

import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_get_user.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_login.dart';
import 'injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/routes/navigation_routes.dart';
import 'config/routes/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';

class RootApp extends StatelessWidget {
  const RootApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => BlocRepositoryOfAuthentication(
        injector<UserLoginUseCase>(),
        injector<UserGetUserUseCase>(),
      ),
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
          authenticationRepository:
              RepositoryProvider.of<BlocRepositoryOfAuthentication>(context),
        ),
        child: ScreenUtilInit(
          designSize: const Size(360, 640),
          builder: () => MaterialApp(
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            navigatorKey: NavigationService.instance.navigatorKey,
            onGenerateRoute: NavigationRoutes.instance.generateRoute,
            builder: (context, child) {
              return BlocListener<AuthenticationBloc, AuthenticationState>(
                listenWhen: (prev, curr) {
                  return prev.status != curr.status;
                },
                listener: (context, state) {
                  switch (state.status) {
                    case AuthenticationStatus.authenticated:
                      NavigationService.instance.navigateToPageClear(
                          path: NavigationConstants
                              .appSelectionAndLocationMergedView);
                      break;
                    case AuthenticationStatus.unauthenticated:
                      NavigationService.instance.navigateToPageClear(
                          path: NavigationConstants.loginView);
                      break;
                    default:
                      NavigationService.instance.navigateToPageClear(
                          path: NavigationConstants.splashView);
                      break;
                  }
                },
                child: child,
              );
            },
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
