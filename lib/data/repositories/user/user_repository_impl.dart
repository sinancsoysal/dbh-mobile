import 'dart:async';

import 'package:mobile/core/params/remote/dbh_api/topics/user/user_params_get_file_manager_login_details.dart';
import 'package:mobile/data/models/models/remote/dbh_api/topics/user/api_result_of_file_manager_login_details.dart';

import '../../../core/resources/use_case.dart';

import '../../../core/params/remote/dbh_api/topics/user/user_params_change_password.dart';

import '../../../config/network/network_operator.dart';
import '../../data_sources/remote/dbh_api/topics/user/user_service.dart';

import '../../models/models/remote/dbh_api/topics/user/auth_result.dart';
import '../../models/models/remote/dbh_api/topics/user/api_result_of_user_dto.dart';
import '../../models/models/api_result.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/params/remote/dbh_api/topics/user/user_params_update_profile.dart';
import '../../../core/params/remote/dbh_api/topics/user/user_params_register_user.dart';
import '../../../core/params/remote/dbh_api/topics/user/user_params_refresh_token.dart';
import '../../../core/params/remote/dbh_api/topics/user/user_params_logout.dart';
import '../../../core/params/remote/dbh_api/topics/user/user_params_login.dart';
import '../../../core/params/remote/dbh_api/topics/user/user_params_get_user.dart';
import '../../../domain/repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userService);

  final UserService _userService;

  @override
  Future<DataState<ApiResultOfUserDto>?> getUser(
      {required UserParamsGetUser params}) async {
    return await NetworkOperator<ApiResultOfUserDto>(
      requestFunction: _userService.getUser(bearerToken: params.bearerToken),
      onFail: (error) {},
    ).request();
  }

  @override
  Future<DataState<AuthResult>?> login(
      {required UserParamsLogin params}) async {
    return await NetworkOperator<AuthResult>(
            requestFunction: _userService.login(
              userLoginDto: params.userLoginDto,
            ),
            onFail: (error) {})
        .request();
  }

  @override
  Future<DataState<ApiResult>?> logout(
      {required UserParamsLogout params}) async {
    return await NetworkOperator<ApiResult>(
            requestFunction: _userService.logout(
              bearerToken: params.bearerToken,
            ),
            onFail: (error) {})
        .request();
  }

  @override
  Future<DataState<AuthResult>?> refreshToken(
      {required UserParamsRefreshToken params}) async {
    return await NetworkOperator<AuthResult>(
            requestFunction: _userService.refreshToken(
              refreshTokenRequest: params.refreshTokenRequest,
              bearerToken: params.bearerToken,
            ),
            onFail: (error) {})
        .request();
  }

  @override
  Future<DataState<ApiResult>?> registerUser(
      {required UserParamsRegisterUser params}) async {
    return await NetworkOperator<ApiResult>(
            requestFunction: _userService.registerUser(
              updateProfileDto: params.registerUserDto,
            ),
            onFail: (error) {})
        .request();
  }

  @override
  Future<DataState<ApiResult>?> updateProfile({
    required UserParamsUpdateProfile params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  }) async {
    return await NetworkOperator<ApiResult>(
      requestFunction: _userService.updateProfile(
        bearerToken: params.berarerToken,
        updateProfileDto: params.updateProfileDto,
      ),
      onFail: onfail,
      onAuthorizationFail: onAuthorizationFail,
      onSuccess: onSuccess,
    ).request();
  }

  @override
  Future<DataState<ApiResult>?> changePassword({
    required UserParamsChangePassword params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  }) async {
    return await NetworkOperator<ApiResult>(
      requestFunction: _userService.changePassword(
        bearerToken: params.bearerToken,
        changePasswordDto: params.changePasswordDto,
      ),
      onSuccess: onSuccess,
      onFail: onfail,
      onAuthorizationFail: onAuthorizationFail,
    ).request();
  }

  @override
  Future<DataState<ApiResultOfFileManagerLoginDetails>?> getFileManagerLoginDetails({
    required UserParamsGetFileManagerLoginDetails params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResultOfFileManagerLoginDetails>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail
  }) async =>NetworkOperator<ApiResultOfFileManagerLoginDetails>(
      requestFunction: _userService.getFileManagerLoginDetails(
          bearerToken: params.bearerToken
      ),
      onAuthorizationFail: onAuthorizationFail,
      onFail: onfail,
      onSuccess: onSuccess
  ).request();

}
