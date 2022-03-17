import 'package:mobile/data/models/dtos/remote/fm_dbh_api/login/fm_dbh_api_login_dto.dart';
import 'package:mobile/core/utils/constants/route_constants/fm_dbh_api_route_constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'fm_login_service.g.dart';

@RestApi(baseUrl: FmDbhApiRouteConstants.BASE_URL)
abstract class FmLoginService {
  factory FmLoginService(Dio dio, {String baseUrl}) = _FmLoginService;

  @POST(FmDbhApiRouteConstants.login)
  Future<HttpResponse> login({
    @Body() required FmDbhApiLoginDto fmDbhApiLoginDto,
  });
}
