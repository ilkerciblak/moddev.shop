import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/presentation/widget/product_detail/_product_detail.dart';

class ProductDetailContent extends StatelessWidget
    with ActionResultPresenterMixin<Product> {
  final ActionResult<Product> productResult;
  ProductDetailContent({
    super.key,
    required this.productResult,
  }) {
    actionResult = productResult;
  }

  @override
  Widget build(BuildContext context) {
    return buildByStatus(context);
  }

  @override
  Widget buildErrorState(BuildContext context, Exception exception) {
    context.showErrorToast(message: exception.toString());
    return _buildWrapper(context,
        errorWidget: Text(
          exception.toString(),
        ));
  }

  @override
  Widget buildLoading(BuildContext context) {
    return _buildWrapper(context,
        headerWidget: SliverSafeArea(
            sliver: SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 3,
          ),
        )),
        detailWidget: const SliverFillRemaining(
          child: ShimmerProductDetailContainer(),
        ));
  }

  @override
  Widget buildSuccess(BuildContext context, Product value) {
    return _buildWrapper(
      context,
      headerWidget: SliverSafeArea(
          sliver: SliverResizingHeader(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 2 / 3,
          child: ProductDetailHeader(
            product: value,
          ),
        ),
      )),
      detailWidget: SliverToBoxAdapter(
        child: ProductDetailContainer(product: value),
      ),
    );
  }

  Widget _buildWrapper(
    BuildContext context, {
    Widget? headerWidget,
    Widget? detailWidget,
    Widget? errorWidget,
  }) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).cardColor,
        child: ElevatedStatefullButton(
          btnText: 'Add to Cart',
          onTap: () {},
          actionResult: actionResult,
        ),
      ),
      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          if (headerWidget != null) headerWidget,
          if (detailWidget != null) detailWidget,
          if (errorWidget != null)
            SliverFillRemaining(
              child: errorWidget,
            )
        ],
      ),
    );
  }
}
