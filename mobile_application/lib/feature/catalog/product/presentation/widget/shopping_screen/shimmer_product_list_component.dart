import 'package:mobile_application/common/_common.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerProductContainer extends StatelessWidget {
  const ShimmerProductContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySilver,
      highlightColor: AppColors.primaryWhite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.imageOverlay,
                borderRadius: BorderRadius.circular(23),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 100,
            height: 15,
            decoration: BoxDecoration(
              color: AppColors.imageOverlay,
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 57,
            height: 15,
            decoration: BoxDecoration(
              color: AppColors.imageOverlay,
              borderRadius: BorderRadius.circular(17),
            ),
          ),
        ],
      ),
    );
  }
}
