import 'package:json_annotation/json_annotation.dart';
part 'activity_log_with_detail_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ActivityLogWithDetailDto {
  final String id;
  final String? createdDate;
  final String? createdTime;
  final String operation;
  final String? detail;
  final String? userName;
  final String? userRole;
  ActivityLogWithDetailDto({
    required this.id,
    this.createdDate,
    this.createdTime,
    required this.operation,
    this.detail,
    this.userName,
    this.userRole,
  });
  factory ActivityLogWithDetailDto.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogWithDetailDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityLogWithDetailDtoToJson(this);
}
