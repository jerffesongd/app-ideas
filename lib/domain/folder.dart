import 'package:json_annotation/json_annotation.dart';
part 'folder.g.dart';

@JsonSerializable()
class Folder {

  @JsonKey(name:"path")
  String name;
  String sha;
  String url;

  Folder(this.name, this.sha, this.url);

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);

  Map<String, dynamic> toJson() => _$FolderToJson(this);

}