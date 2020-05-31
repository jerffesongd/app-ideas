import 'package:json_annotation/json_annotation.dart';
part 'file.g.dart';

@JsonSerializable()
class File {

  @JsonKey(name:"path")
  String name;
  String sha;
  String url;
  @JsonKey(name: "tree")
  List<File> tree;
  String content;
  String type;

  File(this.name, this.sha, this.url, this.content, this.tree, this.type);

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);

  Map<String, dynamic> toJson() => _$FileToJson(this);

  gerContent() {

    if (tree == null || tree.isEmpty) {
      return content;
    } else {
      return tree;
    }

  }

}