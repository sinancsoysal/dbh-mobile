import '../../../../../../data/models/dtos/remote/dbh_api/topics/area/create_area_dto.dart';

class AreaParamsCreate {
  final String bearerToken;
  final CreateAreaDto createAreaDto;
  AreaParamsCreate({
    required this.bearerToken,
    required this.createAreaDto,
  });
}
