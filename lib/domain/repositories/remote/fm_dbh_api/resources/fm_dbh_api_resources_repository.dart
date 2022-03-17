import 'package:mobile/core/params/remote/fm_dbh_api/resources/fm_dbh_api_resources_params.dart';
import 'package:mobile/data/models/models/remote/fm_dbh_api/resources/fm_dbh_api_folder.dart';
import 'package:retrofit/dio.dart' show HttpResponse;

abstract class FmDbhApiResourcesRepository{
  Future<HttpResponse<FmDbhApiFolder?>> fetchFolder({required FmDbhApiResourcesParams fmDbhApiResourcesParams});
}