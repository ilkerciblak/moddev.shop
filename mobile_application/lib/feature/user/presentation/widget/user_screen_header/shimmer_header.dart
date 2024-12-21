import 'package:flutter/material.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserScreenHeader extends StatelessWidget {
  const ShimmerUserScreenHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primarySilver,
      highlightColor: AppColors.primaryWhite,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            height: 100,
          ),
          const SizedBox(height: 7),
          Container(
            width: MediaQuery.of(context).size.width * .4,
            height: 13,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
          ),
          const SizedBox(height: 7),
          Wrap(
            spacing: 3,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .17,
                height: 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .17,
                height: 13,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }
}
