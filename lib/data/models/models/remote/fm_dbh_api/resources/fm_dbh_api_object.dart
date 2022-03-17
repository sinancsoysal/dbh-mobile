import 'package:json_annotation/json_annotation.dart';

part 'fm_dbh_api_object.g.dart';

@JsonSerializable(explicitToJson: true)
class FmDbhApiObject{
  final String path;
  final String name;
  final int size;
  final String extension;
  final String modified;
  final int mode;
  final bool isDir;
  final bool isSymlink;
  final String type;

  FmDbhApiObject({
    required this.path,
    required this.name,
    required this.size,
    required this.extension,
    required this.modified,
    required this.mode,
    required this.isDir,
    required this.isSymlink,
    required this.type
  });

  factory FmDbhApiObject.fromJson(Map<String, dynamic> json) =>
      _$FmDbhApiObjectFromJson(json);

  Map<String, dynamic> toJson() => _$FmDbhApiObjectToJson(this);
}