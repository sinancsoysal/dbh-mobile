import 'package:mobile/core/resources/data_state.dart';
import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';
import 'package:mobile/data/models/dtos/remote/dbh_api/topics/user/file_manager_login_dto.dart';
import 'package:mobile/data/models/models/remote/dbh_api/topics/user/api_result_of_file_manager_login_details.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/user/change_password_dto.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/user/register_user_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/user/update_profile_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/user/user_login_dto.dart';
import '../../../../../models/models/api_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/user/auth_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/user/refresh_token_request.dart';
import '../../../../../models/models/remote/dbh_api/topics/user/api_result_of_user_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'user_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST(DbhApiRouteConstants.userRefreshToken)
  Future<HttpResponse<AuthResult>> refreshToken({
    @Header("Authorization") required String bearerToken,
    @Body() required RefreshTokenRequest refreshTokenRequest,
  });

  @POST(DbhApiRouteConstants.userUpdateProfile)
  Future<HttpResponse<ApiResult>> updateProfile({
    @Header("Authorization") required String bearerToken,
    @Body() required UpdateProfileDto updateProfileDto,
  });

  @POST(DbhApiRouteConstants.userLogin)
  Future<HttpResponse<AuthResult>> login({
    @Body() required UserLoginDto userLoginDto,
  });

  @POST(DbhApiRouteConstants.userRegisterUser)
  Future<HttpResponse<ApiResult>> registerUser({
    @Body() required RegisterUserDto updateProfileDto,
  });

  @GET(DbhApiRouteConstants.userGetUser)
  Future<HttpResponse<ApiResultOfUserDto>> getUser({
    @Header("Authorization") required String bearerToken,
  });

  @POST(DbhApiRouteConstants.userLogout)
  Future<HttpResponse<ApiResult>> logout({
    @Header("Authorization") required String bearerToken,
  });

  @POST(DbhApiRouteConstants.userChangePassword)
  Future<HttpResponse<ApiResult>> changePassword({
    @Header("Authorization") required String bearerToken,
    @Body() required ChangePasswordDto changePasswordDto,
  });

  @GET(DbhApiRouteConstants.getFileManagerLoginDetails)
  Future<HttpResponse<ApiResultOfFileManagerLoginDetails>> getFileManagerLoginDetails({
    @Header("Authorization") required String bearerToken,
  });
}