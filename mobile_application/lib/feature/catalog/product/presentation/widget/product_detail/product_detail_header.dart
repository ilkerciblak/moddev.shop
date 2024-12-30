// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:go_router/go_router.dart';

class ProductDetailHeader extends StatefulWidget {
  final List<String> imgUrlList;
  const ProductDetailHeader({
    super.key,
    required this.imgUrlList,
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
      fit: StackFit.expand,
      children: [
        PageView.builder(
          allowImplicitScrolling: false,
          itemCount: widget.imgUrlList.length,
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
              imageUrl: widget.imgUrlList[index],
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
              widget.imgUrlList.length,
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
        Positioned(
          left: 16.0,
          top: 16.0,
          child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.primaryWhite,
              )),
        ),
      ],
    );
  }
}
