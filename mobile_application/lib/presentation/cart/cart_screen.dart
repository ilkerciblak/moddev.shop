import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/presentation/cart/content/_content.dart';
import 'package:mobile_application/presentation/cart/content/cart_information/cart_information_content.dart';
import 'package:mobile_application/presentation/cart/controller/_controller.dart';
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
      child: Stack(
        children: [
          CustomScrollView(
            key: ObjectKey(cb.state.cart),
            controller: _scrollController,
            slivers: [
              const _BasketAppBar(),
              _CartProductsContent(cb: cb),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _CartInformationContainer(cb: cb),
          )
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

class _BasketAppBar extends StatelessWidget {
  const _BasketAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: false,
      pinned: true,
      // onStretchTrigger: cb.getCart,
      // stretch: true,
      title: Text(
        'Basket',
        style: context.textTheme.bodyLarge,
      ),
      backgroundColor: context.scaffoldTheme.scaffoldBackgroundColor,
    );
  }
}

class _CartInformationContainer extends StatelessWidget {
  const _CartInformationContainer({
    required this.cb,
  });

  final CartScreenCubit cb;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenCubit, CartScreenState>(
      bloc: cb,
      builder: (context, state) => CartInformationContent(
        cartResult: state.cart,
      ),
    );
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
