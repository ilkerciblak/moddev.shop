import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductDetailContainer extends StatelessWidget {
  const ShimmerProductDetailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.secondaryWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(23),
        ),
      ),
      padding: const EdgeInsets.all(17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppSpacing.verticalGapHuge,
          Shimmer.fromColors(
            baseColor: AppColors.primarySilver,
            highlightColor: AppColors.primaryBlack,
            child: Container(
              height: Theme.of(context).textTheme.headlineMedium?.fontSize,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    Theme.of(context).textTheme.headlineMedium?.fontSize ?? 11),
              ),
            ),
          ),
          AppSpacing.verticalGapHuge,
          Row(
            children: [
              Expanded(
                  child: Shimmer.fromColors(
                baseColor: AppColors.primarySilver,
                highlightColor: AppColors.primaryWhite,
                child: Container(
                  height: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        Theme.of(context).textTheme.headlineSmall?.fontSize ??
                            11),
                  ),
                ),
              )),
              const Spacer(),
              Expanded(
                  child: Shimmer.fromColors(
                baseColor: AppColors.primarySilver,
                highlightColor: AppColors.primaryWhite,
                child: Container(
                  height: Theme.of(context).textTheme.headlineSmall?.fontSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        Theme.of(context).textTheme.headlineSmall?.fontSize ??
                            11),
                  ),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
