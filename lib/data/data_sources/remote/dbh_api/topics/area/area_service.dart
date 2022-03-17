import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/area/create_area_dto.dart';
import '../../../../../models/dtos/remote/dbh_api/topics/area/update_area_dto.dart';
import '../../../../../models/models/remote/dbh_api/topics/area/api_result_of_area.dart';
import '../../../../../models/models/remote/dbh_api/topics/area/api_result_of_enumerable_of_area_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../models/models/api_result.dart';

part 'area_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class AreaService {
  factory AreaService(Dio dio, {String baseUrl}) = _AreaService;

  @POST(DbhApiRouteConstants.areaCreate)
  Future<HttpResponse<ApiResult>> create({
    @Header("Authorization") required String bearerToken,
    @Body() required CreateAreaDto createCompanyDto,
  });

  @POST(DbhApiRouteConstants.areaUpdate)
  Future<HttpResponse<ApiResult>> update({
    @Header("Authorization") required String bearerToken,
    @Body() required UpdateAreaDto updateCompanyDto,
  });

  @DELETE(DbhApiRouteConstants.areaDelete)
  Future<HttpResponse<ApiResult>> delete({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.areaGetId)
  Future<HttpResponse<ApiResultOfArea>> getById({
    @Header("Authorization") required String bearerToken,
    @Path("id") required String id,
  });

  @GET(DbhApiRouteConstants.areaGetAll)
  Future<HttpResponse<ApiResultOfEnumerableOfAreaDto>> getAll({
    @Header("Authorization") required String bearerToken,
  });
}
