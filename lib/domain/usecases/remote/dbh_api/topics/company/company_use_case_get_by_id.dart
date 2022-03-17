import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_get_by_id.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/company/api_result_of_company.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyGetByIdUseCase
    implements UseCase<DataState<ApiResultOfCompany>, CompanyParamsGetById> {
  final CompanyRepository _companyRepository;

  CompanyGetByIdUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResultOfCompany>> call(
          {required CompanyParamsGetById params}) =>
      _companyRepository.getById(params: params);
}
