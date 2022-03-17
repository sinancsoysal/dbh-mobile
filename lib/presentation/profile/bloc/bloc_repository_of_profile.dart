import '../../../core/params/remote/dbh_api/topics/user/user_params_update_profile.dart';
import '../../../core/resources/hive_manager.dart';
import '../../../core/utils/extensions/string/string_to_token_extension.dart';
import '../../../data/data_sources/local/preferences_manager.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/settings/user_dto.dart';
import '../../../data/models/dtos/remote/dbh_api/topics/user/update_profile_dto.dart';
import '../../../domain/usecases/remote/dbh_api/topics/user/user_use_case_update_profile.dart';
import '../../authentication/bloc/authentication_bloc/authentication_repository.dart';
import '../../widgets/template_components/custom_snackbar.dart';
import 'package:flutter/widgets.dart' show BuildContext, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocRepositoryOfProfile {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController usernameController;
  late TextEditingController currentPasswordController;
  late TextEditingController newPasswordController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController permissionController;

  final UserUpdateProfileUseCase _userUpdateProfileUseCase;
  final BuildContext _context;

  BlocRepositoryOfProfile(this._userUpdateProfileUseCase, BuildContext context)
      : _context = context;

  initControllers(UserDto? user) {
    nameController =
        TextEditingController(text: user?.firstName ?? "Bilgi yüklenemedi");
    surnameController =
        TextEditingController(text: user?.lastName ?? "Bilgi yüklenemedi");
    usernameController =
        TextEditingController(text: user?.username ?? "Bilgi yüklenemedi");
    currentPasswordController = TextEditingController();
    newPasswordController = TextEditingController();
    phoneNumberController =
        TextEditingController(text: user?.phoneNumber ?? "Bilgi yüklenemedi");
    emailController =
        TextEditingController(text: user?.email ?? "Bilgi yüklenemedi");
    permissionController =
        TextEditingController(text: user?.role ?? "Bilgi yüklenemedi");
  }

  String? get getCachedToken =>
      PreferencesManager.instance.getStringValue(PreferencesKeys.token);

  profileSubmitted() async {
    await _userUpdateProfileUseCase(
      params: UserParamsUpdateProfile(
        berarerToken: getCachedToken?.tokenize ?? "",
        updateProfileDto: UpdateProfileDto(
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
          firstName: nameController.text,
          lastName: surnameController.text,
          image: "string",
        ),
      ),
      onSuccess: (result) async {
        IHiveManager<UserDto>? cacheManager =
            _context.read<BlocRepositoryOfAuthentication>().cacheManager;
        UserDto? userDto =
            _context.read<BlocRepositoryOfAuthentication>().getUser();
        await cacheManager?.putItem(
          HiveConstants.userTypeId.toString(),
          userDto!.copyWith(
            email: emailController.text,
            phoneNumber: phoneNumberController.text,
            firstName: nameController.text,
            lastName: surnameController.text,
          ),
        );
        CustomSnackBar(_context, "Başarılı", isSuccess: true).show;
      },
      onfail: (error) {
        CustomSnackBar.fromList(_context, error).show;
      },
      onAuthorizationFail: () {
        CustomSnackBar(_context,
            "Oturumunuz geçerli değil. Tekrar giriş yapmayı deneyin.");
      },
    );
  }

  void close() {
    nameController.dispose();
    surnameController.dispose();
    usernameController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    permissionController.dispose();
  }
}
