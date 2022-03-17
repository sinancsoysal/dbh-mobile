import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_create.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyCreateUseCase
    implements UseCase<DataState<ApiResult>, CompanyParamsCreate> {
  final CompanyRepository _companyRepository;

  CompanyCreateUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResult>> call({required CompanyParamsCreate params}) =>
      _companyRepository.create(params: params);
}
