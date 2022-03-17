import 'package:mobile/core/params/remote/dbh_api/topics/user/user_params_get_file_manager_login_details.dart';
import 'package:mobile/data/models/models/remote/dbh_api/topics/user/api_result_of_file_manager_login_details.dart';

import '../../../../../../core/resources/data_state.dart';
import '../../../../../../core/resources/use_case.dart';
import '../../../../../repositories/remote/dbh_api/topics/user/user_repository.dart';

class UserGetFileManagerLoginDetailsUseCase
    implements UseCase<DataState<ApiResultOfFileManagerLoginDetails>?, UserParamsGetFileManagerLoginDetails> {
  final UserRepository _userRepository;

  UserGetFileManagerLoginDetailsUseCase(this._userRepository);

  @override
  Future<DataState<ApiResultOfFileManagerLoginDetails>?> call({
    required UserParamsGetFileManagerLoginDetails params,
    ConditionOperator? onAuthorizationFail,
    ConditionValueOperator<DataState<ApiResultOfFileManagerLoginDetails>?>? onSuccess,
    ConditionValueOperator<List<String>>? onFail
      }) async=> _userRepository.getFileManagerLoginDetails(
          params: params,
          onfail: onFail,
          onAuthorizationFail: onAuthorizationFail,
          onSuccess: onSuccess
      );
}
