import 'package:mobile/core/params/remote/fm_dbh_api/resources/fm_dbh_api_resources_params.dart';
import 'package:mobile/data/data_sources/remote/fm_dbh_api/resources/fm_dbh_api_resources_service.dart';
import 'package:mobile/data/models/models/remote/fm_dbh_api/resources/fm_dbh_api_folder.dart';
import 'package:mobile/domain/repositories/remote/fm_dbh_api/resources/fm_dbh_api_resources_repository.dart';
import 'package:retrofit/dio.dart';

class FmDbhApiResourcesRepositoryImpl implements FmDbhApiResourcesRepository{
  FmDbhApiResourcesRepositoryImpl(this._fmDbhApiResourcesService);

  final FmDbhApiResourcesService _fmDbhApiResourcesService;

  @override
  Future<HttpResponse<FmDbhApiFolder?>> fetchFolder({
    required FmDbhApiResourcesParams fmDbhApiResourcesParams
  })async=> _fmDbhApiResourcesService.fetchFolder(
      cookieToken: fmDbhApiResourcesParams.cookieToken,
      xAuthToken: fmDbhApiResourcesParams.authToken,
      folderPath: fmDbhApiResourcesParams.folderPath
  );


}