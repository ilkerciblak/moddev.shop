import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_application/feature/catalog/product/application/model/review_dto.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';

@immutable
final class ProductDto {
  final int identifier;
  final int categoryId;
  final String categoryName;
  final String productName;
  final String productDescription;
  final List<String> images;
  final String thumbnailUrl;
  final double price;
  final double avgRating;
  final List<ReviewDto> reviews;
  final int stockAmount;

  const ProductDto({
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

  Product toEntity() => Product(
        identifier: identifier,
        categoryId: categoryId,
        categoryName: categoryName,
        productName: productName,
        productDescription: productDescription,
        images: images,
        thumbnailUrl: thumbnailUrl,
        price: price,
        avgRating: avgRating,
        reviews: reviews
            .map(
              (e) => e.toEntity(),
            )
            .toList(),
        stockAmount: stockAmount,
      );

  ProductDto copyWith({
    int? identifier,
    int? categoryId,
    String? categoryName,
    String? productName,
    String? productDescription,
    List<String>? images,
    String? thumbnailUrl,
    double? price,
    double? avgRating,
    List<ReviewDto>? reviews,
    int? stockAmount,
  }) {
    return ProductDto(
      identifier: identifier ?? this.identifier,
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      productName: productName ?? this.productName,
      productDescription: productDescription ?? this.productDescription,
      images: images ?? this.images,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      price: price ?? this.price,
      avgRating: avgRating ?? this.avgRating,
      reviews: reviews ?? this.reviews,
      stockAmount: stockAmount ?? this.stockAmount,
    );
  }

  @override
  bool operator ==(covariant ProductDto other) {
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
