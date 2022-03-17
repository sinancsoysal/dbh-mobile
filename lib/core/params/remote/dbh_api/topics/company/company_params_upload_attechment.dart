import 'dart:io';

class CompanyParamsUploadAttacement {
  final String bearerToken;
  final File file;
  CompanyParamsUploadAttacement({
    required this.bearerToken,
    required this.file,
  });
}
