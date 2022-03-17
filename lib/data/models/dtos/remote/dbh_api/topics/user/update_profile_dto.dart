import 'package:json_annotation/json_annotation.dart';

part 'update_profile_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UpdateProfileDto {
  final String? email;
  final String? image;
  final String? phoneNumber;
  final String? firstName;
  final String? lastName;
  UpdateProfileDto({
    this.email,
    this.image,
    this.phoneNumber,
    this.firstName,
    this.lastName,
  });

  factory UpdateProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileDtoToJson(this);
}
