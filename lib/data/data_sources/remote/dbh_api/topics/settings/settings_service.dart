import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/settings/create_role_dto.dart';
import '../../../../../models/models/api_result.dart';
import '../../../../../models/models/remote/dbh_api/topics/settings/api_result_of_enumerable_of_role_claim_dto.dart';
import '../../../../../models/models/remote/dbh_api/topics/settings/api_result_of_enumerable_of_user_dto.dart';

part 'settings_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class SettingsService {
  factory SettingsService(Dio dio, {String baseUrl}) = _SettingsService;

  @POST(DbhApiRouteConstants.settingsCreateRole)
  Future<HttpResponse<ApiResult>> createRole({
    @Header("Authorization") required String bearerToken,
    @Body() required CreateRoleDto createRoleDto,
  });

  @DELETE(DbhApiRouteConstants.settingsDeleteRole)
  Future<HttpResponse<ApiResult>> deleteRole({
    @Header("Authorization") required String bearerToken,
    @Query("role") String? role,
  });

  @GET(DbhApiRouteConstants.settingsGetAllRoles)
  Future<HttpResponse<ApiResultOfEnumerableOfRoleClaimDto>> getAllRoles({
    @Header("Authorization") required String bearerToken,
  });

  @GET(DbhApiRouteConstants.settingsGetAllMembers)
  Future<HttpResponse<ApiResultOfEnumerableOfUserDto>> getAllMembers({
    @Header("Authorization") required String bearerToken,
  });

  @POST(DbhApiRouteConstants.settingsSuspendUser)
  Future<HttpResponse<ApiResult>> suspendUser({
    @Header("Authorization") required String bearerToken,
    @Query("userId") String? userId,
  });
}
