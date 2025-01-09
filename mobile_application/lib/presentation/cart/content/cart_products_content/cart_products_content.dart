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
    return SliverList.builder(
      itemCount: value.products.collection.length,
      itemBuilder: (context, index) {
        return value.products.collection.mapTo(
          (key, c) {
            return CartProductWidget(cartProduct: c);
          },
        ).toList()[index];
      },
    );
  }
}
