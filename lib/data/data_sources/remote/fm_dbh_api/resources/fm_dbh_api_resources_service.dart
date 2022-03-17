import 'package:mobile/data/models/models/remote/fm_dbh_api/resources/fm_dbh_api_folder.dart';
import 'package:mobile/core/utils/constants/route_constants/fm_dbh_api_route_constants.dart';
import 'package:mobile/core/utils/constants/route_constants/fm_dbh_api_param_constants.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'fm_dbh_api_resources_service.g.dart';


@RestApi(baseUrl: FmDbhApiRouteConstants.BASE_URL)
abstract class FmDbhApiResourcesService{
  factory FmDbhApiResourcesService(Dio dio, {String baseUrl}) = _FmDbhApiResourcesService;

  @GET(FmDbhApiRouteConstants.resources)
  Future<HttpResponse<FmDbhApiFolder?>> fetchFolder({
    @Header(FmDbhApiRouteParamConstants.HEADERS_COOKIE) required String cookieToken,
    @Header(FmDbhApiRouteParamConstants.HEADERS_X_AUTH) required String xAuthToken,
    @Path(FmDbhApiRouteParamConstants.params_path) required String folderPath,
  });


}
