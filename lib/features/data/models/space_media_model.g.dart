// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceMediaModel _$SpaceMediaModelFromJson(Map<String, dynamic> json) =>
    SpaceMediaModel(
      explanation: json['explanation'] as String,
      media_type: json['media_type'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$SpaceMediaModelToJson(SpaceMediaModel instance) =>
    <String, dynamic>{
      'explanation': instance.explanation,
      'media_type': instance.media_type,
      'title': instance.title,
      'url': instance.url,
    };
