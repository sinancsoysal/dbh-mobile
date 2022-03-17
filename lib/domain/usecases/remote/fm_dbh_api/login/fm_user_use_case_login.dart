import 'package:mobile/core/params/remote/fm_dbh_api/login/fm_login_params.dart';
import 'package:mobile/core/resources/use_case.dart';
import 'package:mobile/domain/repositories/remote/fm_dbh_api/login/fm_dbh_api_login_repository.dart';
import 'package:retrofit/dio.dart' show HttpResponse;


class FmUserUseCaseLogin
    implements UseCase<HttpResponse, FmLoginParams> {
  final FmDbhApiLoginRepository _fmLoginRepository;

  FmUserUseCaseLogin(this._fmLoginRepository);

  @override
  Future<HttpResponse> call({
    required FmLoginParams params
  })async=>_fmLoginRepository.login(params: params);

}