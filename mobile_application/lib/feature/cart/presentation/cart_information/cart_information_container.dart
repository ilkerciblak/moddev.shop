// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';

/// [Container] Widget that presents Users Current Cart Payment Information
///
/// Use this widget to present user's basket's total price and discounted total price, also add a checkout
/// button to allow user to checkout the basket.
///
/// Attention:
///   - Use cart.products as a value key
class CartInformationContainer extends StatelessWidget {
  final Cart cart;
  final Future<ActionResult<void>> Function() onCheckout;

  const CartInformationContainer({
    super.key,
    required this.cart,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: context.scaffoldTheme.scaffoldBackgroundColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Price',
                style: context.textTheme.labelLarge,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    cart.price.ceil().toString(),
                    style: context.textTheme.labelLarge?.copyWith(
                      decoration: TextDecoration.lineThrough,
                      decorationColor: context.textTheme.labelLarge?.color,
                    ),
                  ),
                  Text(
                    '${cart.discountedPrice.ceil().toString()}\$',
                    style: context.textTheme.displaySmall?.copyWith(
                      color: AppColors.primaryGreen,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(width: 7),
          Expanded(
              child: ElevatedStatefullButton(
            btnText: 'Checkout',
            backgroundColor: AppColors.primaryGreen,
            actionResult: const Idle(),
            onTap: onCheckout,
          )),
        ],
      ),
    );
  }
}
