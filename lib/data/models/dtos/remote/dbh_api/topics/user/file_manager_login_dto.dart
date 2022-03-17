import 'package:json_annotation/json_annotation.dart';

part 'file_manager_login_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class FileManagerLoginDto {
  final String username;
  final String password;
  final String? recaptcha;
  FileManagerLoginDto({
    required this.username,
    required this.password,
    required this.recaptcha
  });
  factory FileManagerLoginDto.fromJson(Map<String, dynamic> json) =>
      _$FileManagerLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FileManagerLoginDtoToJson(this);
}
