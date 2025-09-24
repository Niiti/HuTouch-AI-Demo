import 'package:freezed_annotation/freezed_annotation.dart';
part 'category.freezed.dart';

typedef CategoryId = String;

@freezed
sealed class Category with _$Category {
  const factory Category({
    required CategoryId id,
    required String name,
  }) = _Category;
}