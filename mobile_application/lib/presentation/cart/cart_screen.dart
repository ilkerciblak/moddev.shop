import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/presentation/cart/content/cart_products_content/cart_products_content.dart';
import 'package:mobile_application/presentation/cart/controller/_controller.dart';
import 'package:mobile_application/presentation/cart/controller/cart_screen_cubit.dart';
import 'package:mobile_application/common/_common.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartScreenCubit cb;
  late ScrollController _scrollController;

  @override
  void initState() {
    cb = CartScreenCubit();
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cb,
      child: CustomScrollView(
        key: ObjectKey(cb.state.cart),
        controller: _scrollController,
        slivers: [
          // Products Presenters
          SliverAppBar(
            centerTitle: false,
            pinned: true,
            // onStretchTrigger: cb.getCart,
            // stretch: true,
            title: Text(
              'Basket',
              style: context.textTheme.bodyLarge,
            ),
            backgroundColor: context.scaffoldTheme.scaffoldBackgroundColor,
          ),
          _CartProductsContent(cb: cb),
          // A container for cart information
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _CartProductsContent extends StatelessWidget {
  const _CartProductsContent({
    required this.cb,
  });

  final CartScreenCubit cb;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenCubit, CartScreenState>(
      bloc: cb,
      builder: (context, state) => CartProductsContent(
        cart: state.cart,
      ),
    );
  }
}
