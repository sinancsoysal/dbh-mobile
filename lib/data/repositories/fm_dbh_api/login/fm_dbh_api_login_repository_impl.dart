import 'package:mobile/core/params/remote/fm_dbh_api/login/fm_login_params.dart';
import 'package:mobile/data/models/dtos/remote/fm_dbh_api/login/fm_dbh_api_login_dto.dart';
import 'package:mobile/data/data_sources/remote/fm_dbh_api/login/fm_login_service.dart';
import 'package:mobile/domain/repositories/remote/fm_dbh_api/login/fm_dbh_api_login_repository.dart';
import 'package:retrofit/dio.dart' show HttpResponse;

class FmDbhApiLoginRepositoryImpl implements FmDbhApiLoginRepository{
  FmDbhApiLoginRepositoryImpl(this._fmLoginService);

  final FmLoginService _fmLoginService;

  @override
  Future<HttpResponse> login({
    required FmLoginParams params
  })async=>_fmLoginService.login(
      fmDbhApiLoginDto: FmDbhApiLoginDto(
          password: params.password,
          username: params.username,
          recaptcha: params.recaptcha
      )
  );
}