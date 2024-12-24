import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/category/presentation/_presentation.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_cubit.dart';

class CategoryListingContent extends StatelessWidget
    with ActionResultPresenterMixin<List<Category>> {
  final ActionResult<List<Category>> categoryResult;
  final ValueSetter<Category> onTap;

  CategoryListingContent({
    super.key,
    required this.categoryResult,
    required this.onTap,
  }) {
    actionResult = categoryResult;
  }

  @override
  Widget build(BuildContext context) {
    return buildByStatus(context);
  }

  @override
  Widget buildErrorState(BuildContext context, Exception exception) {
    return Text(exception.toString());
  }

  @override
  Widget buildLoading(BuildContext context) {
    return _buildWrapper(
      itemBuilder: (p1) => const ShimmerCategorySelectionWidget(),
    );
  }

  @override
  Widget buildSuccess(BuildContext context, value) {
    return _buildWrapper(
      itemCount: value.length,
      itemBuilder: (index) => CategorySelectionWidget(
        key: ObjectKey(value[index]),
        category: value[index],
        onTap: onTap,
        isSelected: (category) =>
            context.read<ShoppingScreenCubit>().state.selectedCategory ==
            category,
      ),
    );
  }

  Widget _buildWrapper({
    int itemCount = 10,
    required Widget Function(int) itemBuilder,
  }) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Wrap(
        spacing: 10,
        direction: Axis.horizontal,
        children: List.generate(
          itemCount,
          itemBuilder,
        ),
      ),
    );
  }
}
