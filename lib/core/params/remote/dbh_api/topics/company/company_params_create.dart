import '../../../../../../data/models/dtos/remote/dbh_api/topics/company/create_company_dto.dart';

class CompanyParamsCreate {
  final String bearerToken;
  final String xArea;

  final CreateCompanyDto createCompanyDto;
  CompanyParamsCreate({
    required this.bearerToken,
    required this.createCompanyDto,
    required this.xArea,
  });
}
