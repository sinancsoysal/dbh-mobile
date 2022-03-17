import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_check_repeat.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyCheckRepeatUseCase
    implements UseCase<DataState<ApiResult>, CompanyParamsCheckRepeat> {
  final CompanyRepository _companyRepository;

  CompanyCheckRepeatUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required CompanyParamsCheckRepeat params}) =>
      _companyRepository.checkRepeat(params: params);
}
