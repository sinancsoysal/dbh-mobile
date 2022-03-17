import 'dart:math' show Random;
///String must be character string. like; const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
extension RandomStringGeneratorExtensionFromString on String{
  String generateRandomStringFromCharSet(int length){
    final Random _random=Random.secure();

    return String.fromCharCodes(
        Iterable.generate(
            length,
                (_) => codeUnitAt(_random.nextInt(length))
        )
    );
  }

  ///Can be used on empty string like; ''.generateRandomString(5);
  String generateRandomString(int length){
    final Random _random=Random.secure();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

    return String.fromCharCodes(
        Iterable.generate(
            length,
                (_) => _chars.codeUnitAt(_random.nextInt(length))
        )
    );
  }
}

///Random must be somethin in final Random _random=Random.secure(); and below code can use
///if a lot of strings needed to generate, than it can be problem creating random object in function
///prevent that, it can be contains Random object in which needed class as variable and it can be used directly.
///Plus charset must be like; const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
extension RandomStringGeneratorExtensionFromRandomObject on Random{
  String generateRandomStringFromRandomObject(int length, String charset){
    return String.fromCharCodes(
        Iterable.generate(
            length,
                (_) => charset.codeUnitAt(nextInt(length))
        )
    );
  }
}


