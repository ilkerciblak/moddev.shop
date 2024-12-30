import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

final class CachedNetworkImageWidget extends CachedNetworkImage {
  CachedNetworkImageWidget({
    super.key,
    required super.imageUrl,
    super.cacheKey,
  }) : super(
          fadeInCurve: Easing.linear,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, progress) =>
              const CircularProgressIndicator.adaptive(),
        );
}
