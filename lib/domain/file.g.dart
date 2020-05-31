// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

File _$FileFromJson(Map<String, dynamic> json) {
  return File(
    json['path'] as String,
    json['sha'] as String,
    json['url'] as String,
    json['content'] as String,
    (json['tree'] as List)
        ?.map(
            (e) => e == null ? null : File.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['type'] as String,
  );
}

Map<String, dynamic> _$FileToJson(File instance) => <String, dynamic>{
      'path': instance.name,
      'sha': instance.sha,
      'url': instance.url,
      'tree': instance.tree,
      'content': instance.content,
      'type': instance.type,
    };
