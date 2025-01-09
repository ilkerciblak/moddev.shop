import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/presentation/widget/_widget.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListingContent extends StatelessWidget
    with
        ActionResultPresenterMixin<List<Product>>,
        ActionResultSnackbarMixin<List<Product>> {
  final ActionResult<List<Product>> productResult;
  ProductListingContent({super.key, required this.productResult}) {
    actionResult = productResult;
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
        onRetry: context.read<ShoppingScreenCubit>().getProducts,
      ),
    );
  }

  @override
  Widget buildLoading(BuildContext context) {
    return _buildWrapper(
      itemBuilder: (index) => const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: ShimmerProductContainer(),
      ),
    );
  }

  @override
  Widget buildSuccess(BuildContext context, value) {
    return _buildWrapper(
      itemCount: value.length,
      itemBuilder: (index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        child: ProductListComponent(
          product: value[index],
          onAddPressed: (productId) => context
              .read<ShoppingScreenCubit>()
              .onAddtoCartPressed(productId: productId)
              .showActionResultToast(
                context,
                successMessage: 'Product Added to Cart',
              ),
        ),
      ),
    );
  }

  Widget _buildWrapper({
    int itemCount = 10,
    required Widget Function(int) itemBuilder,
  }) {
    return SliverGrid.builder(
      itemCount: itemCount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        mainAxisSpacing: 5,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return itemBuilder(index);
      },
    );
  }
}
