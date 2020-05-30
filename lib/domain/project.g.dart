// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
    json['sha'] as String,
    json['url'] as String,
    (json['tree'] as List)
        ?.map((e) =>
            e == null ? null : Folder.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'sha': instance.sha,
      'url': instance.url,
      'tree': instance.tree,
    };
