import 'package:mobile/core/params/remote/fm_dbh_api/login/fm_login_params.dart';
import 'package:retrofit/dio.dart' show HttpResponse;

abstract class FmDbhApiLoginRepository{
  Future<HttpResponse> login({required FmLoginParams params});
}
