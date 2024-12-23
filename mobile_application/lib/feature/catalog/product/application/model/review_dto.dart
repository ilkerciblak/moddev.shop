import 'package:flutter/foundation.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';

@immutable
final class ReviewDto {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  const ReviewDto({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  ReviewDto copyWith({
    int? rating,
    String? comment,
    DateTime? date,
    String? reviewerName,
    String? reviewerEmail,
  }) {
    return ReviewDto(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      date: date ?? this.date,
      reviewerName: reviewerName ?? this.reviewerName,
      reviewerEmail: reviewerEmail ?? this.reviewerEmail,
    );
  }

  Review toEntity() => Review(
        rating: rating,
        comment: comment,
        date: date,
        reviewerName: reviewerName,
        reviewerEmail: reviewerEmail,
      );

  @override
  bool operator ==(covariant ReviewDto other) {
    if (identical(this, other)) return true;

    return other.rating == rating &&
        other.comment == comment &&
        other.date == date &&
        other.reviewerName == reviewerName &&
        other.reviewerEmail == reviewerEmail;
  }

  @override
  int get hashCode {
    return rating.hashCode ^
        comment.hashCode ^
        date.hashCode ^
        reviewerName.hashCode ^
        reviewerEmail.hashCode;
  }
}
