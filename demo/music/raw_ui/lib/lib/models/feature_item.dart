import 'package:json_annotation/json_annotation.dart';

part 'feature_item.g.dart';

@JsonSerializable()
class FeatureItem {
  final String imageURL;
  final String title;

  FeatureItem({
    required this.imageURL,
    required this.title,
  });

  factory FeatureItem.fromJson(Map<String, dynamic> json) => _$FeatureItemFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureItemToJson(this);
}