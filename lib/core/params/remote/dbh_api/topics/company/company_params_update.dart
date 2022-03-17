import '../../../../../../data/models/dtos/remote/dbh_api/topics/company/update_company_dto.dart';

class CompanyParamsUpdate {
  final String bearerToken;
  final UpdateCompanyDto updateCompanyDto;
  final String xArea;

  CompanyParamsUpdate({
    required this.bearerToken,
    required this.updateCompanyDto,
    required this.xArea,
  });
}
