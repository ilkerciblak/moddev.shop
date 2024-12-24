import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mobile_application/feature/catalog/category/presentation/_presentation.dart';
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
          SliverToBoxAdapter(
            child: BlocBuilder<ShoppingScreenCubit, ShoppingScreenState>(
              bloc: cb,
              builder: (context, state) => CategoryListingContent(
                key: ObjectKey(state.categories),
                categoryResult: state.categories,
                onTap: (value) => cb.onCategorySelected(value),
              ),
            ),
          )
        ],
      )),
    );
  }
}
