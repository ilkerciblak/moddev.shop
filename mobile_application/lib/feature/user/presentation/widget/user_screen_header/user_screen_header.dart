import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/feature/user/domain/_domain.dart';
import 'package:mobile_application/common/_common.dart';

class UserScreenHeader extends StatelessWidget {
  final User user;
  final double shrinkOffset;
  const UserScreenHeader({
    super.key,
    required this.user,
    required this.shrinkOffset,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
        scale: shrinkOffset,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: user.imageUrl,
              fadeInCurve: Easing.linear,
              fit: BoxFit.cover,
              height: 100 * shrinkOffset,
              progressIndicatorBuilder: (context, url, progress) =>
                  const CircularProgressIndicator.adaptive(),
            ),
            Text(
              user.email,
              style: context.textTheme.bodyMedium,
            ),
            Text(
              '${user.firstName} ${user.lastName}',
              style: context.textTheme.bodyMedium,
            )
          ],
        ));
  }
}
