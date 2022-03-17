import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_get_all.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/company/api_result_of_enumerable_of_company.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyGetAllUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfCompany>,
            CompanyParamsGetAll> {
  final CompanyRepository _companyRepository;

  CompanyGetAllUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfCompany>> call(
          {required CompanyParamsGetAll params}) =>
      _companyRepository.getAll(params: params);
}
