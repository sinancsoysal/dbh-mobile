import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_delete.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyDeleteUseCase
    implements UseCase<DataState<ApiResult>, CompanyParamsDelete> {
  final CompanyRepository _companyRepository;

  CompanyDeleteUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResult>> call({required CompanyParamsDelete params}) =>
      _companyRepository.delete(params: params);
}
