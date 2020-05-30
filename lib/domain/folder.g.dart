// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Folder _$FolderFromJson(Map<String, dynamic> json) {
  return Folder(
    json['path'] as String,
    json['sha'] as String,
    json['url'] as String,
  );
}

Map<String, dynamic> _$FolderToJson(Folder instance) => <String, dynamic>{
      'path': instance.name,
      'sha': instance.sha,
      'url': instance.url,
    };
