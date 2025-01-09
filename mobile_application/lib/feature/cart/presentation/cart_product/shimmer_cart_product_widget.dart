import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCartProductWidget extends StatelessWidget {
  const ShimmerCartProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryWhite,
      highlightColor: AppColors.primaryBlack,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.imageOverlay,
                borderRadius: BorderRadius.circular(17),
              ),
            ),
          ),
          Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Container(
                width: context.sized.mediaQuery.size.width / 2,
                height: context.textTheme.bodyMedium?.fontSize,
                decoration: BoxDecoration(
                  color: AppColors.imageOverlay,
                  borderRadius: BorderRadius.circular(
                    context.textTheme.bodyMedium?.fontSize ?? 17,
                  ),
                ),
              ),
              AppSpacing.verticalGapSmall,
              Container(
                width: 40,
                height: context.textTheme.labelSmall?.fontSize,
                decoration: BoxDecoration(
                  color: AppColors.imageOverlay,
                  borderRadius: BorderRadius.circular(
                    context.textTheme.labelSmall?.fontSize ?? 17,
                  ),
                ),
              ),
              AppSpacing.verticalGapMd,
              // _TotalPrice(cartProduct: cartProduct),
              Container(
                width: 40,
                height: context.textTheme.bodyMedium?.fontSize,
                decoration: BoxDecoration(
                  color: AppColors.imageOverlay,
                  borderRadius: BorderRadius.circular(
                    context.textTheme.bodyMedium?.fontSize ?? 17,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
