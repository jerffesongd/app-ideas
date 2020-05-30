import 'package:app_ideas/domain/folder.dart';
import 'package:json_annotation/json_annotation.dart';
part 'project.g.dart';

@JsonSerializable()
class Project {

  String sha;
  String url;
  @JsonKey(name: "tree")
  List<Folder> tree;

  Project(this.sha, this.url, this.tree);

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);

}