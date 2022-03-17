import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../core/resources/hive_manager.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
@HiveType(typeId: HiveConstants.userTypeId)
class UserDto {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? username;
  @HiveField(2)
  final String? lastName;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String? email;
  @HiveField(5)
  final String? role;
  @HiveField(6)
  final String? phoneNumber;
  @HiveField(7)
  final String? areaId;
  @HiveField(8)
  final String? firstName;
  UserDto({
    required this.id,
    this.username,
    this.lastName,
    this.image,
    this.email,
    this.role,
    this.phoneNumber,
    this.firstName,
    required this.areaId,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserDto copyWith({
    String? id,
    String? username,
    String? lastName,
    String? image,
    String? email,
    String? role,
    String? phoneNumber,
    String? areaId,
    String? firstName,
  }) {
    return UserDto(
      id: id ?? this.id,
      username: username ?? this.username,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      email: email ?? this.email,
      role: role ?? this.role,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      areaId: areaId ?? this.areaId,
      firstName: firstName ?? this.firstName,
    );
  }
}
