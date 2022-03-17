import 'package:json_annotation/json_annotation.dart';

part 'fm_dbh_api_login_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class FmDbhApiLoginDto{
  final String username;
  final String password;
  final String recaptcha;

  FmDbhApiLoginDto({
    required this.password,
    required this.username,
    required this.recaptcha
  });

  factory FmDbhApiLoginDto.fromJson(Map<String, dynamic> json) =>
      _$FmDbhApiLoginDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FmDbhApiLoginDtoToJson(this);
}
