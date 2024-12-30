// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:go_router/go_router.dart';

class ProductSearchResultComponent extends StatelessWidget {
  final Product product;
  const ProductSearchResultComponent({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).listTileTheme.tileColor,
      dense: true,
      leading: CachedNetworkImage(
        imageUrl: product.thumbnailUrl,
        fadeInCurve: Easing.linear,
        fit: BoxFit.contain,
        width: 50,
        progressIndicatorBuilder: (context, url, progress) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
      title: Row(
        children: [
          Expanded(
              child: Text(
            product.productName,
          ))
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
              child: Text(
            product.categoryName,
          ))
        ],
      ),
      onTap: () {
        context.pushNamed('product-detail', pathParameters: {
          'id': product.identifier.toString(),
        });
      },
    );
  }
}
