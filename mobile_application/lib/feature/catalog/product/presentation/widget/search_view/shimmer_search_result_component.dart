import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSearchResultComponent extends StatelessWidget {
  const ShimmerSearchResultComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).listTileTheme.tileColor?.withOpacity(0.2),
      dense: true,
      leading: Shimmer.fromColors(
        baseColor: AppColors.primarySilver,
        highlightColor: AppColors.primaryWhite,
        child: Container(
          width: 50,
          height: 50,
          color: Colors.white,
        ),
      ),
      title: Row(
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColors.primarySilver,
              highlightColor: AppColors.primaryWhite,
              child: Container(
                height: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: AppColors.primarySilver,
              highlightColor: AppColors.primaryWhite,
              child: Container(
                height: 14,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
