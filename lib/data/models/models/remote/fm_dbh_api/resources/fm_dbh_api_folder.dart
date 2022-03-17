import 'package:json_annotation/json_annotation.dart';
import 'fm_dbh_api_object.dart';
import 'fm_dbh_api_sort.dart';

part 'fm_dbh_api_folder.g.dart';

@JsonSerializable(explicitToJson: true)
class FmDbhApiFolder{
  final List<FmDbhApiObject>? items;
  final int numDirs;
  final int numFiles;
  final FmDbhApiSort sorting;
  final String path;
  final String name;
  final int size;
  final String extension;
  final String modified;
  final int mode;
  final bool isDir;
  final bool isSymlink;
  final String type;


  FmDbhApiFolder({
    required this.items,
    required this.numDirs,
    required this.numFiles,
    required this.sorting,
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

  factory FmDbhApiFolder.fromJson(Map<String, dynamic> json) =>
      _$FmDbhApiFolderFromJson(json);

  Map<String, dynamic> toJson() => _$FmDbhApiFolderToJson(this);
}