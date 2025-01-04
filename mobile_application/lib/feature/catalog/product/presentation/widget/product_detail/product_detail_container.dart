// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';

class ProductDetailContainer extends StatelessWidget {
  final Product product;
  const ProductDetailContainer({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(23),
        ),
        color: AppColors.secondaryWhite,
      ),
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppSpacing.verticalGapHuge,
          // Product Title and Price
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _ProductTitle(product: product),
              const Spacer(),
              _ProductPriceWidget(product: product)
            ],
          ),
          // Average Rating(# of reviews) and Last Amount of Stocks
          AppSpacing.verticalGapHuge,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _AverageRatingAndReviews(product: product),
              _InStockPresenter(product: product),
            ],
          ),
          AppSpacing.verticalGapMd,
          const Divider(),
          // Product Description
          _ProductDescriptionWidget(product: product),
          AppSpacing.verticalGapMd,
          const Divider(),
          // Product Reviews
          _DummyReviews(product: product),
        ],
      ),
    );
  }
}

class _DummyReviews extends StatelessWidget {
  const _DummyReviews({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
                color: AppColors.primaryBlack,
              )
              .withOpacity(0.7),
        ),
        AppSpacing.verticalGapSmall,
        ...List.generate(
          product.reviews.length,
          (index) {
            Review review = product.reviews[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Reviewer Name and Rating
                Row(
                  children: [
                    Text(
                      review.reviewerName,
                      style: context.theme.bodySmall?.copyWith(
                        color: AppColors.primaryBlack,
                      ),
                    ),
                    const Spacer(),
                    Wrap(
                      spacing: 3,
                      children: [
                        Icon(
                          Icons.star,
                          size: context.theme.bodyLarge?.fontSize,
                        ),
                        Text(
                          review.rating.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.primaryBlack),
                        ),
                        Text('|',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.primaryBlack)),
                        Text(review.date.toShortDateString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: AppColors.primaryBlack))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),

                Text(
                  product.reviews[index].comment,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.primaryBlack),
                ),
                AppSpacing.verticalGapLarge
              ],
            );
          },
        )
      ],
    );
  }
}

class _ProductDescriptionWidget extends StatelessWidget {
  const _ProductDescriptionWidget({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      // direction: Axis.vertical,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
                color: AppColors.primaryBlack,
              )
              .withOpacity(0.7),
        ),
        AppSpacing.verticalGapMd,
        Text(
          product.productDescription,
          style: context.theme.bodyMedium?.copyWith(
            color: AppColors.primaryBlack,
          ),
        )
      ],
    );
  }
}

class _InStockPresenter extends StatelessWidget {
  const _InStockPresenter({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Last ${product.stockAmount.toString()} in stock',
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(
            color: AppColors.primaryBlack,
          )
          .withOpacity(0.7),
    );
  }
}

class _AverageRatingAndReviews extends StatelessWidget {
  const _AverageRatingAndReviews({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Icon(
          Icons.star,
          size: context.theme.bodyLarge?.fontSize,
        ),
        Text(
          product.avgRating.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: AppColors.primaryBlack),
        ),
        const SizedBox(width: 5),
        Text(
          '| ${product.reviews.length * product.price.truncate()} reviews',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(
                color: AppColors.primaryBlack,
              )
              .withOpacity(0.7),
        )
      ],
    );
  }
}

class _ProductPriceWidget extends StatelessWidget {
  const _ProductPriceWidget({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${product.price.toString()}\$',
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: AppColors.primaryBlack),
    );
  }
}

class _ProductTitle extends StatelessWidget {
  const _ProductTitle({
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Text(
        product.productName,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: AppColors.primaryBlack),
      ),
    );
  }
}
