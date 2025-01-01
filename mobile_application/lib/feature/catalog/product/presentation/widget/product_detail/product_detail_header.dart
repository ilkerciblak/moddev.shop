import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/presentation/widget/product_search_component/product_search_component.dart';

class ProductDetailHeader extends StatefulWidget {
  final Product product;
  const ProductDetailHeader({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailHeader> createState() => _ProductDetailHeaderState();
}

class _ProductDetailHeaderState extends State<ProductDetailHeader> {
  final PageController _pageController = PageController(initialPage: 0);
  ValueNotifier<int> pageCounter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        PageView.builder(
          allowImplicitScrolling: false,
          itemCount: widget.product.images.length,
          controller: _pageController,
          onPageChanged: (value) {
            _pageController.animateToPage(
              value,
              duration: Durations.long2,
              curve: Easing.legacyDecelerate,
            );
            pageCounter.value = value;
          },
          itemBuilder: (context, index) {
            return CachedNetworkImageWidget(
              imageUrl: widget.product.images[index],
            );
          },
        ),
        Positioned(
          bottom: 5.0,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: List.generate(
              widget.product.images.length,
              (index) => ValueListenableBuilder(
                valueListenable: pageCounter,
                builder: (context, value, child) => AnimatedContainer(
                  duration: Durations.long1,
                  height: 7,
                  width: pageCounter.value == index ? 14 : 7,
                  margin: const EdgeInsets.only(right: 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: pageCounter.value == index
                        ? AppColors.primaryWhite
                        : AppColors.primaryWhite.withOpacity(0.5),
                    // shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primaryWhite,
              )),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ProductSearchComponent.searchSimilar(
            query: widget.product.categoryName,
          ),
        ),
      ],
    );
  }
}
