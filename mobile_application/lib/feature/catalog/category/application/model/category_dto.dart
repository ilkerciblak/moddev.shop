import 'package:flutter/foundation.dart' hide Category;
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';

@immutable
final class CategoryDto {
  final int identifier;
  final String name;
  final String slug;

  const CategoryDto({
    required this.identifier,
    required this.name,
    required this.slug,
  });

  Category toEntity() {
    return Category(
      identifier: identifier,
      name: name,
      slug: slug,
    );
  }

  CategoryDto copyWith({
    int? identifier,
    String? name,
    String? slug,
  }) {
    return CategoryDto(
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(covariant CategoryDto other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.name == name &&
        other.slug == slug;
  }

  @override
  int get hashCode => identifier.hashCode ^ name.hashCode ^ slug.hashCode;
}
