import 'package:flutter/foundation.dart';

@immutable
final class Category {
  final int identifier;
  final String name;
  final String slug;

  const Category({
    required this.identifier,
    required this.name,
    required this.slug,
  });

  Category copyWith({
    int? identifier,
    String? name,
    String? slug,
  }) {
    return Category(
      identifier: identifier ?? this.identifier,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.identifier == identifier &&
        other.name == name &&
        other.slug == slug;
  }

  @override
  int get hashCode => identifier.hashCode ^ name.hashCode ^ slug.hashCode;
}
