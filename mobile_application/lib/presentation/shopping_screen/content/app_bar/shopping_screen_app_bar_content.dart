import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/feature/catalog/product/presentation/widget/product_search_component/product_search_component.dart';
import 'package:mobile_application/presentation/shopping_screen/content/app_bar/category/category_list_content.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_cubit.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_state.dart';

class ShoppingScreenAppBarContent extends StatelessWidget {
  const ShoppingScreenAppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingScreenCubit cb = context.read<ShoppingScreenCubit>();

    return SliverAppBar(
      clipBehavior: Clip.none,
      scrolledUnderElevation: 0.0,
      titleSpacing: 0.0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floating: true,
      actions: [
        ProductSearchComponent.searchIcon(),
      ],
      title: BlocBuilder<ShoppingScreenCubit, ShoppingScreenState>(
        bloc: cb,
        builder: (context, state) {
          return CategoryListingContent(
            key: ObjectKey(state.categories),
            categoryResult: state.categories,
            onTap: (value) {
              cb.onCategorySelected(value);
            },
            isSelectedFunction: (category) =>
                state.selectedCategory == category,
          );
        },
      ),

      // title: ,
    );
  }
}
