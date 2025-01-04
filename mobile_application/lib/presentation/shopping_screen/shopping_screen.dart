import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';

import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/presentation/shopping_screen/content/app_bar/shopping_screen_app_bar_content.dart';
import 'package:mobile_application/presentation/shopping_screen/content/product_list/product_listing_content.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_cubit.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_state.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  late ShoppingScreenCubit cb;
  late SearchController searchController = SearchController();

  @override
  void initState() {
    cb = ShoppingScreenCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cb,
      child: SafeArea(
          child: CustomScrollView(
        slivers: [
          const ShoppingScreenAppBarContent(),
          _FilteredCategoryHeader(cb: cb),
          _ProductListBuilder(cb: cb)
        ],
      )),
    );
  }
}

class _ProductListBuilder extends StatelessWidget {
  const _ProductListBuilder({
    required this.cb,
  });

  final ShoppingScreenCubit cb;

  @override
  Widget build(BuildContext context) {
    return BlocSelectorT<ActionResult<List<Product>>>(
      bloc: cb,
      selector: (state) => state.products,
      builder: (context, state) {
        return ProductListingContent(
          key: ObjectKey(state),
          productResult: state,
        );
      },
    );
  }
}

class _FilteredCategoryHeader extends StatelessWidget {
  const _FilteredCategoryHeader({
    required this.cb,
  });

  final ShoppingScreenCubit cb;

  @override
  Widget build(BuildContext context) {
    return BlocSelectorT<Category?>(
      bloc: cb,
      selector: (state) => state.selectedCategory,
      builder: (context, state) {
        return SliverAppBar(
          key: ObjectKey(state),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          pinned: true,
          actions: [
            if (state != null)
              TextButton(
                  onPressed: cb.clearFilter, child: const Text('Clear Filter'))
          ],
          centerTitle: false,
          title: Text(
            state?.name ?? 'Featured Products',
            style: context.theme.titleLarge,
          ),
        );
      },
    );
  }
}

typedef BlocSelectorT<T>
    = BlocSelector<ShoppingScreenCubit, ShoppingScreenState, T>;
