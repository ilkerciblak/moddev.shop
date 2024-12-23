import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_application/feature/catalog/product/domain/review.dart';

@immutable
final class Product {
  final int identifier;
  final int categoryId;
  final String categoryName;
  final String productName;
  final String productDescription;
  final List<String> images;
  final String thumbnailUrl;
  final double price;
  final double avgRating;
  final List<Review> reviews;
  final int stockAmount;

  const Product({
    required this.identifier,
    required this.categoryId,
    required this.categoryName,
    required this.productName,
    required this.productDescription,
    required this.images,
    required this.thumbnailUrl,
    required this.price,
    required this.avgRating,
    required this.reviews,
    required this.stockAmount,
  });

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.identifier == identifier &&
        other.categoryId == categoryId &&
        other.categoryName == categoryName &&
        other.productName == productName &&
        other.productDescription == productDescription &&
        listEquals(other.images, images) &&
        other.thumbnailUrl == thumbnailUrl &&
        other.price == price &&
        other.avgRating == avgRating &&
        listEquals(other.reviews, reviews) &&
        other.stockAmount == stockAmount;
  }

  @override
  int get hashCode {
    return identifier.hashCode ^
        categoryId.hashCode ^
        categoryName.hashCode ^
        productName.hashCode ^
        productDescription.hashCode ^
        images.hashCode ^
        thumbnailUrl.hashCode ^
        price.hashCode ^
        avgRating.hashCode ^
        reviews.hashCode ^
        stockAmount.hashCode;
  }
}
