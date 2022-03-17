import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_update.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyUpdateUseCase
    implements UseCase<DataState<ApiResult>, CompanyParamsUpdate> {
  final CompanyRepository _companyRepository;

  CompanyUpdateUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResult>> call({required CompanyParamsUpdate params}) =>
      _companyRepository.update(params: params);
}
