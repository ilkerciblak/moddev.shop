import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';

class ShoppingScreenState {
  final ActionResult<List<Category>> categories;
  final ActionResult<List<Product>> products;
  final Category? selectedCategory;

  ShoppingScreenState({
    required this.categories,
    required this.products,
    this.selectedCategory,
  });

  factory ShoppingScreenState.initial() => ShoppingScreenState(
        categories: const Idle(),
        products: const Idle(),
      );

  ShoppingScreenState copyWith({
    ActionResult<List<Category>>? categories,
    ActionResult<List<Product>>? products,
    Category? selectedCategory,
  }) {
    return ShoppingScreenState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  ShoppingScreenState clearFilter() =>
      ShoppingScreenState(categories: categories, products: products);

  @override
  bool operator ==(covariant ShoppingScreenState other) {
    if (identical(this, other)) return true;

    return other.categories == categories &&
        other.products == products &&
        other.selectedCategory == selectedCategory;
  }

  @override
  int get hashCode =>
      categories.hashCode ^ products.hashCode ^ selectedCategory.hashCode;
}
