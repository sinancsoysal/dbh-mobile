import '../../../../core/params/remote/dbh_api/topics/user/user_params_register_user.dart';
import '../../../../core/resources/data_state.dart';
import '../../../../data/models/dtos/remote/dbh_api/topics/user/register_user_dto.dart';
import '../../../../data/models/models/api_result.dart';
import '../../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_register_user.dart';
import '../../../widgets/template_components/custom_snackbar.dart';
import 'package:flutter/material.dart';

class BlocRepositoryOfRegister {
  BlocRepositoryOfRegister(this._registerUseCase);

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  final UserRegisterUseCase _registerUseCase;

  Future<DataState<ApiResult>?> register({
    required String name,
    required String password,
    required String email,
    required String phoneNumber,
    required String username,
    required String firstName,
    required String lastName,
    required String confirmPassword,
  }) async {
    final registerUseCaseResult = await _registerUseCase(
      params: UserParamsRegisterUser(
        registerUserDto: RegisterUserDto(
          phoneNumber: phoneNumber,
          username: username,
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          role: "user",
        ),
      ),
    );

    return registerUseCaseResult;
  }

  void showSnackBar(List<String> errors, BuildContext context) {
    try {
      var errorMessage = errors.reduce(
        (value, element) => value + "\n" + element,
      );
      CustomSnackBar(context, errorMessage).show;
    } catch (_) {
      CustomSnackBar(context, "Hata").show;
    }
  }
}
