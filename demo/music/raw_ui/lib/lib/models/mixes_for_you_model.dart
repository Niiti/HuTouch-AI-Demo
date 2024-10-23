import 'package:json_annotation/json_annotation.dart';

part 'mixes_for_you_model.g.dart';

@JsonSerializable()
class MixesForYouModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<String> tracks;

  MixesForYouModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.tracks,
  });

  factory MixesForYouModel.fromJson(Map<String, dynamic> json) => _$MixesForYouModelFromJson(json);
  Map<String, dynamic> toJson() => _$MixesForYouModelToJson(this);
}