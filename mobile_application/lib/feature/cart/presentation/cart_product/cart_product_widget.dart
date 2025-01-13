// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';

class CartProductWidget extends StatelessWidget {
  final CartProduct cartProduct;
  final Future<ActionResult<void>> Function(int productId) onDissmiss;
  final void Function(int productId, int quantity) onQuantityChanged;
  const CartProductWidget({
    super.key,
    required this.cartProduct,
    required this.onDissmiss,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(cartProduct.identifier),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () => onDissmiss(cartProduct.identifier),
        ),
        children: [
          SlidableAction(
            onPressed: (context) {
              onDissmiss(cartProduct.identifier);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          _ProductThumbnail(cartProduct: cartProduct),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductTitle(cartProduct: cartProduct),
                AppSpacing.verticalGapSmall,
                _ProductUnitPrice(cartProduct: cartProduct),
                AppSpacing.verticalGapMd,
                _TotalPrice(cartProduct: cartProduct),
              ],
            ),
          ),
          // const Spacer(),

          const SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

class _TotalPrice extends StatelessWidget {
  const _TotalPrice({
    required this.cartProduct,
  });

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 5,
      children: [
        Text(
          cartProduct.totalPrice.toString(),
          style: context.textTheme.bodyMedium?.copyWith(
            decoration: TextDecoration.lineThrough,
            decorationColor: context.textTheme.bodyMedium?.color,
          ),
        ),
        Text(
          '${cartProduct.discountedTotalPrice.toString()}\$',
          style: context.textTheme.titleLarge,
        )
      ],
    );
  }
}

class _ProductUnitPrice extends StatelessWidget {
  const _ProductUnitPrice({
    required this.cartProduct,
  });

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 5,
      children: [
        Text(
          'Unit Price:',
          style: context.textTheme.labelSmall,
        ),
        Text(
          '${cartProduct.price.toString()}\$',
          style: context.textTheme.labelSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class _ProductTitle extends StatelessWidget {
  const _ProductTitle({
    required this.cartProduct,
  });

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      cartProduct.title,
      style: context.textTheme.titleMedium,
    );
  }
}

class _ProductThumbnail extends StatelessWidget {
  const _ProductThumbnail({
    required this.cartProduct,
  });

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed('product-detail', pathParameters: {
          'id': cartProduct.identifier.toString(),
        });
      },
      child: SizedBox(
        height: 100,
        child: CachedNetworkImageWidget(
          imageUrl: cartProduct.thumbnail,
        ),
      ),
    );
  }
}
