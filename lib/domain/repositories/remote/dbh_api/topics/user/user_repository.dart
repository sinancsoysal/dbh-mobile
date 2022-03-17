import 'package:mobile/core/params/remote/dbh_api/topics/user/user_params_get_file_manager_login_details.dart';
import 'package:mobile/data/models/dtos/remote/dbh_api/topics/user/file_manager_login_dto.dart';
import 'package:mobile/data/models/models/remote/dbh_api/topics/user/api_result_of_file_manager_login_details.dart';

import '../../../../../../core/resources/use_case.dart';

import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_change_password.dart';

import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_get_user.dart';
import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_login.dart';
import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_logout.dart';
import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_refresh_token.dart';
import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_register_user.dart';
import '../../../../../../core/params/remote/dbh_api/topics/user/user_params_update_profile.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/user/auth_result.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/user/api_result_of_user_dto.dart';

abstract class UserRepository {
  Future<DataState<AuthResult>?> refreshToken(
      {required UserParamsRefreshToken params});
  Future<DataState<ApiResult>?> updateProfile({
    required UserParamsUpdateProfile params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  });
  Future<DataState<AuthResult>?> login({required UserParamsLogin params});
  Future<DataState<ApiResult>?> registerUser(
      {required UserParamsRegisterUser params});
  Future<DataState<ApiResultOfUserDto>?> getUser(
      {required UserParamsGetUser params});

  Future<DataState<ApiResult>?> logout({required UserParamsLogout params});

  Future<DataState<ApiResult>?> changePassword({
    required UserParamsChangePassword params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResult>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail,
  });

  Future<DataState<ApiResultOfFileManagerLoginDetails>?> getFileManagerLoginDetails({
    required UserParamsGetFileManagerLoginDetails params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResultOfFileManagerLoginDetails>?>? onSuccess,
    ConditionValueOperator<List<String>>? onfail
  });
}
