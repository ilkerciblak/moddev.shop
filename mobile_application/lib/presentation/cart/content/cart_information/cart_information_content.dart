import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';
import 'package:mobile_application/feature/cart/presentation/_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/presentation/cart/controller/_controller.dart';

class CartInformationContent extends StatelessWidget
    with ActionResultPresenterMixin<Cart> {
  final ActionResult<Cart> cartResult;
  CartInformationContent({super.key, required this.cartResult}) {
    actionResult = cartResult;
  }

  @override
  Widget build(BuildContext context) {
    return buildByStatus(context);
  }

  @override
  Widget buildErrorState(BuildContext context, Exception exception) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildLoading(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuccess(BuildContext context, value) {
    return _buildSuccess(context, value);
  }

  Widget _buildSuccess(BuildContext context, Cart cart) {
    if (cart.products.collection.length == 0) {
      return const SizedBox.shrink();
    }

    return CartInformationContainer(
      cart: cart,
      onCheckout: context.read<CartScreenCubit>().checkout,
    );
  }
}
