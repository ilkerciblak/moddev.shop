import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:go_router/go_router.dart';

class ProductListComponent extends StatelessWidget {
  final Product product;
  const ProductListComponent({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                context.pushNamed('product-detail', pathParameters: {
                  'id': product.identifier.toString(),
                });
              },
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23),
                    color: AppColors.imageOverlay,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: product.images.first,
                    fadeInCurve: Easing.linear,
                    fit: BoxFit.contain,
                    cacheKey: product.images.first.hashCode.toString(),
                    progressIndicatorBuilder: (context, url, progress) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  // GetIt.instance<CartCubit>().addProduct(
                  //     context: context, productId: product.identifier);
                },
                icon: const Icon(Icons.add_circle),
                color: AppColors.primaryBlack,
              ),
            ),
          ],
        ),
        Text(
          product.productName,
          // style: AppFontStyles.boldBlack13,
          maxLines: 2,
        ),
        Text(
          '\$ ${product.price}',
          // style: AppFontStyles.boldBlack13.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
