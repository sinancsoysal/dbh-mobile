import 'package:json_annotation/json_annotation.dart';
part 'update_area_dto.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class UpdateAreaDto {
  final String title;
  final String image;
  UpdateAreaDto({
    required this.title,
    required this.image,
  });
  factory UpdateAreaDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateAreaDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAreaDtoToJson(this);
}
