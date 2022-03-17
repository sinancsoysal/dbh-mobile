import 'package:mobile/core/utils/constants/route_constants/dbh_api_route_constants.dart';

import '../../../../../models/dtos/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_with_detail_dto.dart';

import '../../../../../models/models/remote/dbh_api/topics/activity_log/api_result_of_enumerable_of_activity_log_dto.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'activity_log_service.g.dart';

@RestApi(baseUrl: DbhApiRouteConstants.BASE_URL)
abstract class ActivityLogService {
  factory ActivityLogService(Dio dio, {String baseUrl}) = _ActivityLogService;

  @GET(DbhApiRouteConstants.activityLogGetByUser)
  Future<HttpResponse<ApiResultOfEnumerableOfActivityLogDto>> getByUser({
    @Header("Authorization") required String bearerToken,
  });

  @GET(DbhApiRouteConstants.activityLogGetLatestLogs)
  Future<HttpResponse<ApiResultOfEnumerableOfActivityLogWithDetailDto>>
      getLatestLogs({
    @Header("Authorization") required String bearerToken,
  });
  @GET(DbhApiRouteConstants.getLogsWithDetails)
  Future<HttpResponse<ApiResultOfEnumerableOfActivityLogWithDetailDto>>
      getLogsWithDetails({
    @Header("Authorization") required String bearerToken,
  });
}
