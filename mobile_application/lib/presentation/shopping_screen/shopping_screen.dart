import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/_catalog.dart';
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_cubit.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_state.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  late ShoppingScreenCubit cb;

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
          BlocBuilder<ShoppingScreenCubit, ShoppingScreenState>(
            bloc: cb,
            builder: (context, state) => SliverToBoxAdapter(
              child: CategoryListingContent(
                key: ObjectKey(state.categories),
                categoryResult: state.categories,
                onTap: (value) => cb.onCategorySelected(value),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: AppSpacing.verticalGapMd,
          ),
          BlocSelectorT<Category?>(
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
                        onPressed: cb.clearFilter, child: Text('Clear Filter'))
                ],
                centerTitle: false,
                title: Text(
                  state?.name ?? 'Featured Products',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            },
          ),
          BlocSelectorT<ActionResult<List<Product>>>(
            bloc: cb,
            selector: (state) => state.products,
            builder: (context, state) {
              return ProductListingContent(
                key: ObjectKey(state),
                productResult: state,
              );
            },
          )
        ],
      )),
    );
  }
}

typedef BlocSelectorT<T>
    = BlocSelector<ShoppingScreenCubit, ShoppingScreenState, T>;
