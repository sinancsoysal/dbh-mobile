import 'package:connectivity/connectivity.dart';
import 'package:mobile/core/utils/constants/route_constants/fm_dbh_api_route_constants.dart';
import 'package:mobile/data/data_sources/local/preferences_manager.dart';
import 'package:mobile/data/data_sources/remote/fm_dbh_api/login/fm_login_service.dart';
import 'package:mobile/data/data_sources/remote/fm_dbh_api/resources/fm_dbh_api_resources_service.dart';
import 'package:mobile/data/repositories/fm_dbh_api/login/fm_dbh_api_login_repository_impl.dart';
import 'package:mobile/data/repositories/fm_dbh_api/resources/fm_dbh_api_resources_repository_impl.dart';
import 'package:mobile/domain/repositories/remote/fm_dbh_api/login/fm_dbh_api_login_repository.dart';
import 'package:mobile/domain/repositories/remote/fm_dbh_api/resources/fm_dbh_api_resources_repository.dart';
import 'package:mobile/domain/usecases/remote/dbh_api/topics/user/user_use_case_get_file_manager_login_details.dart';
import 'package:mobile/domain/usecases/remote/fm_dbh_api/login/fm_user_use_case_login.dart';
import 'package:mobile/domain/usecases/remote/fm_dbh_api/resources/fm_dbh_api_resources_use_case.dart';
import 'config/network/interceptor/dio_connectivity_request_retrier.dart';
import 'config/network/interceptor/retry_interceptor.dart';
import 'data/data_sources/remote/dbh_api/topics/invoice/invoice_service.dart';
import 'data/repositories/invoice/invoice_repository_impl.dart';
import 'data/repositories/main_expense/main_expense_repository_impl.dart';
import 'domain/repositories/remote/dbh_api/topics/invoice/invoice_repository.dart';
import 'domain/repositories/remote/dbh_api/topics/main_expense/main_expense_repository.dart';
import 'domain/usecases/remote/dbh_api/topics/activity_log/activity_log_get_logs_with_details.dart';
import 'domain/usecases/remote/dbh_api/topics/invoice/invoice_use_case_get_all.dart';
import 'domain/usecases/remote/dbh_api/topics/invoice/invoice_with_items_use_case_get_all.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_refresh_token.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_update_profile.dart';

import 'config/network/interceptor/dio_refresh_authentication_retrier.dart';
import 'data/data_sources/remote/dbh_api/topics/activity_log/activity_log_service.dart';
import 'data/data_sources/remote/dbh_api/topics/main_expense/main_expense_service.dart';
import 'data/repositories/area/area_repository_impl.dart';
import 'domain/usecases/remote/dbh_api/topics/activity_log/activity_log_get_latest_logs.dart';
import 'domain/usecases/remote/dbh_api/topics/main_expense/main_expense_use_case_get_comparison.dart';
import 'domain/usecases/remote/dbh_api/topics/main_expense/main_expense_use_case_get_most_used.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_change_password.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_register_user.dart';
import 'package:dio/dio.dart';

import 'data/data_sources/remote/dbh_api/topics/area/area_service.dart';
import 'data/data_sources/remote/dbh_api/topics/user/user_service.dart';
import 'data/repositories/activity_log/activity_log_repository.dart';
import 'domain/repositories/remote/dbh_api/topics/activity_log/activity_log_repository.dart';
import 'domain/repositories/remote/dbh_api/topics/area/area_repository.dart';
import 'domain/repositories/remote/dbh_api/topics/user/user_repository.dart';
import 'domain/usecases/remote/dbh_api/topics/area/area_use_case_get_all.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_get_user.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/user/user_repository_impl.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_login.dart';
import 'domain/usecases/remote/dbh_api/topics/user/user_use_case_logout.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector.registerSingleton<Dio>(
    Dio()
      ..interceptors.addAll(
        [
          RetryOnConnectionChangeInterceptor(
            requestRetrier: DioConnectivityRequestRetrier(
              dio: Dio(),
              connectivity: Connectivity(),
            ),
            refreshAuthenticationRetrier: DioRefreshAuthenticationRetrier(
              dio: Dio(),
            ),
          ),
        ],
      ),
  );

  injector.registerSingleton<Dio>(
    Dio(),
    instanceName: "dioWithoutInterceptor"
  );

  // SERVICE INJECTORS
  // User Service
  injector.registerSingleton<UserService>(
    UserService(
      injector(),
    ),
  );

  // Activity Log Service
  injector.registerSingleton<ActivityLogService>(
    ActivityLogService(
      injector(),
    ),
  );
  // Area Service
  injector.registerSingleton<AreaService>(
    AreaService(
      injector(),
    ),
  );
  // Main Expense Service
  injector.registerSingleton<MainExpenseService>(
    MainExpenseService(
      injector(),
    ),
  );
  // Invoice Service
  injector.registerSingleton<InvoiceService>(
    InvoiceService(
      injector(),
    ),
  );

  //FmLoginService for fm.dbh api
  injector.registerSingleton<FmLoginService>(
      FmLoginService(injector<Dio>(instanceName: "dioWithoutInterceptor"))
  );

  //FmDbhApiResourcesService = for fm.dbh files
  injector.registerSingleton<FmDbhApiResourcesService>(
      FmDbhApiResourcesService(injector<Dio>(instanceName: "dioWithoutInterceptor"))
  );



  // REMOTE REPOSITORY INJECTORS
  // Auth Repository
  injector.registerSingletonAsync<UserRepository>(
    () async => UserRepositoryImpl(
      injector(),
    ),
  );

  //Activity Log Repository
  injector.registerSingletonAsync<ActivityLogRepository>(
    () async => ActivityLogRepositoryImpl(
      injector(),
    ),
  );

  //Area Repository
  injector.registerSingletonAsync<AreaRepository>(
    () async => AreaRepositoryImpl(
      injector(),
    ),
  );

  //Main Expense Repository
  injector.registerSingletonAsync<MainExpenseRepository>(
    () async => MainExpenseRepositoryImpl(
      injector<MainExpenseService>(),
    ),
  );

  //Invoices Repository
  injector.registerSingletonAsync<InvoiceRepository>(
    () async => InvoiceRepositoryImpl(
      injector<InvoiceService>(),
    ),
  );

  //FmLoginRepository
  injector.registerSingletonAsync<FmDbhApiLoginRepository>(
          () async => FmDbhApiLoginRepositoryImpl(
          injector<FmLoginService>()
      )
  );

  //FmLoginRepository
  injector.registerSingletonAsync<FmDbhApiResourcesRepository>(
          () async => FmDbhApiResourcesRepositoryImpl(
          injector<FmDbhApiResourcesService>()
      )
  );

  // USE CASE INJECTORS
  // User Use Cases
  injector.registerSingletonWithDependencies<UserLogoutUseCase>(
    () => UserLogoutUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );

  injector.registerSingletonWithDependencies<UserRefreshTokenUseCase>(
    () => UserRefreshTokenUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );

  injector.registerSingletonWithDependencies<UserGetUserUseCase>(
    () => UserGetUserUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );
  injector.registerSingletonWithDependencies<UserLoginUseCase>(
    () => UserLoginUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );
  injector.registerSingletonWithDependencies<UserRegisterUseCase>(
    () => UserRegisterUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );

  injector.registerSingletonWithDependencies<UserChangePasswordUseCase>(
    () => UserChangePasswordUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );

  injector.registerSingletonWithDependencies<UserUpdateProfileUseCase>(
    () => UserUpdateProfileUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );

  injector.registerSingletonWithDependencies<UserGetFileManagerLoginDetailsUseCase>(
        () => UserGetFileManagerLoginDetailsUseCase(
      injector<UserRepository>(),
    ),
    dependsOn: [UserRepository],
  );

  //Area Usecases
  injector.registerSingletonWithDependencies<AreaGetaAllUseCase>(
    () => AreaGetaAllUseCase(
      injector<AreaRepository>(),
    ),
    dependsOn: [AreaRepository],
  );

  // Actvity Log UseCase
  injector.registerSingletonWithDependencies<ActivityLogGetLatestLogsUseCase>(
    () => ActivityLogGetLatestLogsUseCase(
      injector<ActivityLogRepository>(),
    ),
    dependsOn: [ActivityLogRepository],
  );
  injector
      .registerSingletonWithDependencies<ActivityLogGetLogWithDetailssUseCase>(
    () => ActivityLogGetLogWithDetailssUseCase(
      injector<ActivityLogRepository>(),
    ),
    dependsOn: [ActivityLogRepository],
  );

  // Main Expense UseCase
  injector.registerSingletonWithDependencies<MainExpenseGetMostUsedUseCase>(
    () => MainExpenseGetMostUsedUseCase(
      injector<MainExpenseRepository>(),
    ),
    dependsOn: [MainExpenseRepository],
  );
  injector.registerSingletonWithDependencies<MainExpenseGetComparisonUseCase>(
    () => MainExpenseGetComparisonUseCase(
      injector<MainExpenseRepository>(),
    ),
    dependsOn: [MainExpenseRepository],
  );

  //Invoices UseCase
  injector.registerSingletonWithDependencies<InvoiceGetAllUseCase>(
    () => InvoiceGetAllUseCase(
      injector<InvoiceRepository>(),
    ),
    dependsOn: [InvoiceRepository],
  );

  injector.registerSingletonWithDependencies<InvoiceGetAllWithItemsUseCase>(
    () => InvoiceGetAllWithItemsUseCase(
      injector<InvoiceRepository>(),
    ),
    dependsOn: [InvoiceRepository],
  );


  injector.registerSingletonWithDependencies<FmUserUseCaseLogin>(
          () => FmUserUseCaseLogin(
          injector<FmDbhApiLoginRepository>()
      ),
      dependsOn: [FmDbhApiLoginRepository]
  );

  injector.registerSingletonWithDependencies<FmDbhApiResourcesUseCase>(
          () => FmDbhApiResourcesUseCase(
          injector<FmDbhApiResourcesRepository>()
      ),
      dependsOn: [FmDbhApiResourcesRepository]
  );

  // BLOC REPOSITORY INJECTORS

  // BLOC INJECTORS
}
