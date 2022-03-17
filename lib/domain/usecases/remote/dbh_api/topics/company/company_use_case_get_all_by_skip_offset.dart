import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_get_all_by_skip_offset.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/company/api_result_of_enumerable_of_company.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyGetAllBySkipOffsetUseCase
    implements
        UseCase<DataState<ApiResultOfEnumerableOfCompany>,
            CompanyParamsGetAllBySkipOffset> {
  final CompanyRepository _companyRepository;

  CompanyGetAllBySkipOffsetUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResultOfEnumerableOfCompany>> call(
          {required CompanyParamsGetAllBySkipOffset params}) =>
      _companyRepository.getAllBySkipOffset(params: params);
}
