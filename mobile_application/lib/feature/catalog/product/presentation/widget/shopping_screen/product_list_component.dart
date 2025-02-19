import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/presentation/_presentation.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:go_router/go_router.dart';

class ProductListComponent extends StatelessWidget {
  final Product product;
  // final void Function(int productId) onAddPressed;
  final void Function() onQuantityChanged;

  const ProductListComponent({
    super.key,
    required this.product,
    required this.onQuantityChanged,
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
                  child: CachedNetworkImageWidget(
                    imageUrl: product.images.first,
                    cacheKey: product.images.first.hashCode.toString(),
                    // },
                  ),
                ),
              ),
            ),
            _AddToCartProcessor(
                onQuantityChanged: onQuantityChanged, product: product)
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

class _AddToCartProcessor extends StatelessWidget {
  const _AddToCartProcessor({
    required this.onQuantityChanged,
    required this.product,
  });

  final void Function() onQuantityChanged;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 0,
      child: QuantitySelector(
        key: ValueKey(product.identifier),
        productId: product.identifier,
        onQuantityChanged: () => onQuantityChanged(),
      ),
    );
  }
}
