import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_check_repeat.dart';
import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_create.dart';
import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_delete.dart';
import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_get_all.dart';
import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_get_all_by_skip_offset.dart';
import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_get_by_id.dart';
import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_update.dart';
import '../../../../../../core/params/remote/dbh_api/topics/company/company_params_upload_attechment.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../data/models/models/api_result.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/company/api_result_of_company.dart';
import '../../../../../../data/models/models/remote/dbh_api/topics/company/api_result_of_enumerable_of_company.dart';

abstract class CompanyRepository {
  Future<DataState<ApiResult>> create({CompanyParamsCreate params});
  Future<DataState<ApiResult>> update({CompanyParamsUpdate params});
  Future<DataState<ApiResult>> delete({CompanyParamsDelete params});
  Future<DataState<ApiResult>> checkRepeat({CompanyParamsCheckRepeat params});
  Future<DataState<ApiResult>> uploadAttachment(
      {CompanyParamsUploadAttacement params});
  Future<DataState<ApiResultOfCompany>> getById({CompanyParamsGetById params});
  Future<DataState<ApiResultOfEnumerableOfCompany>> getAll(
      {CompanyParamsGetAll params});
  Future<DataState<ApiResultOfEnumerableOfCompany>> getAllBySkipOffset(
      {CompanyParamsGetAllBySkipOffset params});
}
