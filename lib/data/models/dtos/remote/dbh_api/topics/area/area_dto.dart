import 'package:json_annotation/json_annotation.dart';
part 'area_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AreaDto {
  final String id;
  final String? title;
  final String? image;
  AreaDto({
    required this.id,
    this.title,
    this.image,
  });

  factory AreaDto.fromJson(Map<String, dynamic> json) =>
      _$AreaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AreaDtoToJson(this);
}
