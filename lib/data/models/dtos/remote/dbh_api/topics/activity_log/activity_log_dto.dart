import 'package:json_annotation/json_annotation.dart';

part 'activity_log_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ActivityLogDto {
  final String? id;
  final String? createdDate;
  final String? userId;
  final String? type;
  final String? identity;
  ActivityLogDto({
    this.id,
    this.createdDate,
    this.userId,
    this.type,
    this.identity,
  });

  factory ActivityLogDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityLogDtoToJson(this);
}
