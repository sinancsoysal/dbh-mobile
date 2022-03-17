import '../../../widgets/template_components/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';

class BlocRepositoryOfLogin {
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
