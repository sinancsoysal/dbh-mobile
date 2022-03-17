import 'package:mobile/core/params/remote/fm_dbh_api/resources/fm_dbh_api_resources_params.dart';
import 'package:mobile/core/resources/use_case.dart';
import 'package:mobile/data/models/models/remote/fm_dbh_api/resources/fm_dbh_api_folder.dart';
import 'package:mobile/domain/repositories/remote/fm_dbh_api/resources/fm_dbh_api_resources_repository.dart';
import 'package:retrofit/dio.dart' show HttpResponse;


class FmDbhApiResourcesUseCase implements UseCase<HttpResponse<FmDbhApiFolder?>, FmDbhApiResourcesParams> {
  final FmDbhApiResourcesRepository _fmDbhApiResourcesRepository;

  FmDbhApiResourcesUseCase(this._fmDbhApiResourcesRepository);

  @override
  Future<HttpResponse<FmDbhApiFolder?>> call({
    required FmDbhApiResourcesParams params
  })async=>_fmDbhApiResourcesRepository.fetchFolder(
      fmDbhApiResourcesParams: params
  );

}