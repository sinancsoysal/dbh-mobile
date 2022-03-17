import 'package:json_annotation/json_annotation.dart';

part 'fm_dbh_api_sort.g.dart';

@JsonSerializable(explicitToJson: true)
class FmDbhApiSort{
  final String by;
  final bool asc;

  FmDbhApiSort({
    required this.by,
    required this.asc
  });

  factory FmDbhApiSort.fromJson(Map<String, dynamic> json) =>
      _$FmDbhApiSortFromJson(json);

  Map<String, dynamic> toJson() => _$FmDbhApiSortToJson(this);
}