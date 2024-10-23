// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mixes_for_you_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MixesForYouModel _$MixesForYouModelFromJson(Map<String, dynamic> json) =>
    MixesForYouModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      tracks:
          (json['tracks'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MixesForYouModelToJson(MixesForYouModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'tracks': instance.tracks,
    };
