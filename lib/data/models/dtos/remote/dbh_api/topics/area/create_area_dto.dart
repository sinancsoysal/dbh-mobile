import 'package:json_annotation/json_annotation.dart';
part 'create_area_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateAreaDto {
  final String title;
  final String image;
  CreateAreaDto({
    required this.title,
    required this.image,
  });
  factory CreateAreaDto.fromJson(Map<String, dynamic> json) =>
      _$CreateAreaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAreaDtoToJson(this);
}
