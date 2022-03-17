import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_upload_attechment.dart';
import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../repositories/remote/dbh_api/topics/company/company_repository.dart';

class CompanyUploadAttechmentUseCase
    implements UseCase<DataState<ApiResult>, CompanyParamsUploadAttacement> {
  final CompanyRepository _companyRepository;

  CompanyUploadAttechmentUseCase(this._companyRepository);

  @override
  Future<DataState<ApiResult>> call(
          {required CompanyParamsUploadAttacement params}) =>
      _companyRepository.uploadAttachment(params: params);
}
