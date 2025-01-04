import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:shimmer/shimmer.dart';

/// Loading State Widget of the [CategorySelectionWidget]
class ShimmerCategorySelectionWidget extends StatelessWidget {
  const ShimmerCategorySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryWhite,
      highlightColor: AppColors.primarySilver,
      child: Container(
        width: 50,
        height: context.theme.titleMedium?.fontSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            context.theme.titleMedium?.fontSize ?? 13,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
