import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/feature/cart/presentation/_presentation.dart';
import 'package:mobile_application/presentation/cart/controller/cart_screen_cubit.dart';

class CartProductsContent extends StatelessWidget
    with ActionResultPresenterMixin<Cart> {
  final ActionResult<Cart> cart;
  CartProductsContent({
    super.key,
    required this.cart,
  }) {
    actionResult = cart;
  }

  @override
  Widget build(BuildContext context) {
    return buildByStatus(context);
  }

  @override
  Widget buildErrorState(BuildContext context, Exception exception) {
    return SliverFillRemaining(
      child: CommonErrorBuilder(
        exception: exception,
        onRetry: () {
          context.read<CartScreenCubit>().getCart();
        },
      ),
    );
  }

  @override
  Widget buildLoading(BuildContext context) {
    return SliverList.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return List.generate(
          7,
          (index) {
            return const ShimmerCartProductWidget();
          },
        )[index];
      },
    );
  }

  @override
  Widget buildSuccess(BuildContext context, value) {
    return _buildSuccess(context, value.products);
  }

  Widget _buildSuccess(
      BuildContext context, CartProductCollection itemCollection) {
    if (itemCollection.collection.length == 0) {
      return SliverFillRemaining(
        fillOverscroll: false,
        hasScrollBody: false,
        child: Container(
          // clipBehavior: Clip.,
          decoration: BoxDecoration(
            border: Border.all(
              color: context.scaffoldTheme.scaffoldBackgroundColor!,
            ),
            borderRadius: BorderRadius.circular(7),
            // color: Colors.red,
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                color: AppColors.primarySilver,
              ),
              Text('No Item in Basket'),
            ],
          ),
        ),
      );
    }

    return SliverList.builder(
      itemCount: itemCollection.collection.length,
      itemBuilder: (context, index) {
        return itemCollection.collection.mapTo(
          (key, c) {
            return CartProductWidget(
              cartProduct: c,
              onDissmiss: (productId) =>
                  context.read<CartScreenCubit>().deleteProduct(productId),
              onQuantityChanged: (productId, quantity) {
                context.read<CartScreenCubit>().getCart();
              },
            );
          },
        ).toList()[index];
      },
    );
  }
}
