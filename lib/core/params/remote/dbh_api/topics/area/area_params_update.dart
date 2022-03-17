import '../../../../../../data/models/dtos/remote/dbh_api/topics/area/update_area_dto.dart';

class AreaParamsUpdate {
  final String bearerToken;
  final UpdateAreaDto updateAreaDto;
  AreaParamsUpdate({
    required this.bearerToken,
    required this.updateAreaDto,
  });
}
