import 'dart:async';

import '../../../../core/resources/hive_manager.dart';
import '../../../../data/data_sources/local/hive/user_dto_hive_manager.dart';
import '../../../../data/models/models/remote/dbh_api/topics/user/auth_result.dart';

import '../../../../core/params/remote/dbh_api/topics/user/user_params_get_user.dart';
import '../../../../core/params/remote/dbh_api/topics/user/user_params_login.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../data/data_sources/local/preferences_manager.dart';
import '../../../../data/models/dtos/remote/dbh_api/topics/settings/user_dto.dart';
import '../../../../data/models/dtos/remote/dbh_api/topics/user/user_login_dto.dart';
import '../../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_get_user.dart';
import '../../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_login.dart';
import '../../../../core/utils/extensions/string/string_to_token_extension.dart';
import 'package:hive/hive.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class BlocRepositoryOfAuthentication {
  BlocRepositoryOfAuthentication(
      this._userLoginUseCase, this._userGetUserUseCase);

  IHiveManager<UserDto>? cacheManager;

  final StreamController<AuthenticationStatus> _controller =
      StreamController<AuthenticationStatus>();

  UserDto? _user;
  final UserGetUserUseCase _userGetUserUseCase;
  final UserLoginUseCase _userLoginUseCase;

  initHive() async {
    cacheManager = UserHiveManager(HiveConstants.userTypeId.toString());
    await cacheManager!.init();
  }

  Stream<AuthenticationStatus> get status async* {
    final String? token = getCachedToken;

    if (token != null) {
      _controller.add(AuthenticationStatus.authenticated);
    } else {
      _controller.add(AuthenticationStatus.unauthenticated);
    }
    yield* _controller.stream;
  }

  Future<DataState<AuthResult>?> logIn({
    required String username,
    required String password,
  }) async {
    final userLoginUseCaseResult = await _userLoginUseCase(
      params: UserParamsLogin(
        userLoginDto: UserLoginDto(
          username: username,
          password: password,
        ),
      ),
    );

    if (userLoginUseCaseResult is OperationSuccess) {
      await cacheToken(
        userLoginUseCaseResult!.value!.token!,
        userLoginUseCaseResult.value!.refreshToken!,
      );
      await setUser();
      _controller.add(AuthenticationStatus.authenticated);
    }
    return userLoginUseCaseResult;
  }

  Future<bool> cacheToken(String token, String refreshToken) async {
    try {
      await PreferencesManager.instance.setStringValue(
        PreferencesKeys.token,
        token,
      );
      await PreferencesManager.instance.setStringValue(
        PreferencesKeys.refreshToken,
        refreshToken,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

  String? get getCachedToken =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.token);

  bool get getFirstLogin =>
      PreferencesManager.instance.getBoolValue(PreferencesKeys.isFirstApp);

  Future<void> logOut() async {
    // TODO: Send logout request to api
    await PreferencesManager.instance.clearAllSaveFirst();
    Box box = Hive.box<UserDto>(HiveConstants.userTypeId.toString());
    box.clear();
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> setUser() async {
    // TODO: HANDLE NULL CASES
    final userLoginUseCaseResult = await _userGetUserUseCase(
      params: UserParamsGetUser(bearerToken: getCachedToken!.tokenize),
    );
    if (userLoginUseCaseResult is OperationSuccess) {
      _user = userLoginUseCaseResult!.value!.data;
      if (_user != null) {
        await cacheManager!
            .putItem(HiveConstants.userTypeId.toString(), _user!);
      }
    }
  }

  UserDto? getUser() {
    _user = cacheManager!.getItem(HiveConstants.userTypeId.toString());
    return _user;
  }

  void dispose() => _controller.close();
}
