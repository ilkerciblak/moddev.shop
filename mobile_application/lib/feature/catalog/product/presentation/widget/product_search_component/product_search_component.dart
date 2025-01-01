// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/presentation/widget/search_view/product_search_result_component.dart';
import 'package:mobile_application/feature/catalog/product/presentation/widget/search_view/shimmer_search_result_component.dart';

class ProductSearchComponent extends StatelessWidget {
  final IProductRepository _productRepository =
      GetIt.instance<IProductRepository>();

  final Widget Function(BuildContext, SearchController) builder;

  ProductSearchComponent({
    super.key,
    required this.builder,
  });

  Future<List<Product>> onSearch({String? query}) async {
    var response = await _productRepository
        .getProductsByCategory(null, categorySlug: query!)
        .run();

    return response.fold((l) => [], (r) => r);
  }

  factory ProductSearchComponent.searchSimilar({
    required String query,
  }) {
    return ProductSearchComponent(
      builder: (context, controller) {
        return TextButton(
          onPressed: () {
            controller.openView();
            controller.text = query;
          },
          child: Text('Similar Products'),
        );
      },
    );
  }

  factory ProductSearchComponent.searchIcon() {
    return ProductSearchComponent(
      builder: (p0, p1) {
        return IconButton(
          onPressed: () {
            p1.openView();
          },
          icon: const Icon(Icons.search_sharp),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomSearchAnchor<Product>(
      builder: builder,
      resultFetchingFunction: (searchText) => onSearch(query: searchText),
      isFullScreen: true,
      resultsBuilder: (value) => ProductSearchResultComponent(product: value),
      loadingBuilder: const ShimmerSearchResultComponent(),
      initialRun: true,
    );
  }
}

// CustomSearchAnchor<Product>.icon(
//             resultFetchingFunction: (search) => cb.onSearch(query: search),
//             resultsBuilder: (value) =>
//                 ProductSearchResultComponent(product: value),
//             loadingBuilder: const ShimmerSearchResultComponent(),
//             queryHintText: 'Search for products',
//           )

// Future<List<Product>> onSearch({String? query}) async {
//     var response = await _productRepository
//         .getProductsByCategory(
//           null,
//           categorySlug: query!,
//         )
//         .run();

//     return response.fold(
//       (l) {
//         return [];
//       },
//       (r) {
//         return r;
//       },
//     );
//   }