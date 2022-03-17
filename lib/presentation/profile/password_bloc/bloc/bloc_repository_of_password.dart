import '../../../../core/params/remote/dbh_api/topics/user/user_params_change_password.dart';
import '../../../../core/utils/extensions/string/string_to_token_extension.dart';
import '../../../../data/data_sources/local/preferences_manager.dart';
import '../../../../data/models/dtos/remote/dbh_api/topics/user/change_password_dto.dart';
import '../../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_change_password.dart';
import '../../../widgets/template_components/custom_snackbar.dart';
import 'package:flutter/widgets.dart'
    show BuildContext, FocusScope, FormState, GlobalKey, TextEditingController;

class BlocRepositoryOfPassword {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final UserChangePasswordUseCase _changePasswordUseCase;
  final BuildContext _context;

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  String? get getCachedToken =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.token);

  BlocRepositoryOfPassword(this._changePasswordUseCase,
      {required BuildContext context})
      : _context = context;
  void changePassword() async {
    await _changePasswordUseCase(
      params: UserParamsChangePassword(
        bearerToken: getCachedToken!.tokenize,
        changePasswordDto: ChangePasswordDto(
          newPassword: newPasswordController.text,
          oldPassword: currentPasswordController.text,
        ),
      ),
      onSuccess: (result) {
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();
        FocusScope.of(_context).unfocus();
        CustomSnackBar(_context, "Başarılı", isSuccess: true).show;
      },
      onfail: (error) {
        CustomSnackBar.fromList(_context, error).show;
      },
      onAuthorizationFail: () {},
    );
  }
}
