import 'package:json_annotation/json_annotation.dart';

part 'user_login_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UserLoginDto {
  final String username;
  final String password;
  UserLoginDto({
    required this.username,
    required this.password,
  });

  factory UserLoginDto.fromJson(Map<String, dynamic> json) =>
      _$UserLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginDtoToJson(this);
}
