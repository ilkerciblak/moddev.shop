import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/category/domain/_domain.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/presentation/shopping_screen/controller/shopping_screen_state.dart';

final class ShoppingScreenCubit extends Cubit<ShoppingScreenState> {
  final IProductRepository _productRepository =
      GetIt.instance<IProductRepository>();
  final ICategoryRepository _categoryRepository =
      GetIt.instance<ICategoryRepository>();
  ShoppingScreenCubit() : super(ShoppingScreenState.initial()) {
    initPage();
  }

  void initPage() async {
    await Future.wait([
      getCategories(),
      // getProducts(),
    ]);
  }

  Future<ActionResult<List<Category>>> getCategories() async {
    emit(state.copyWith(categories: const Loading()));

    var response = await _categoryRepository.getAllCategories().run();

    return response.fold((l) {
      emit(state.copyWith(categories: Failure(l)));
      return Failure(l);
    }, (r) {
      emit(state.copyWith(categories: Success(r)));
      return Success(r);
    });
  }

  Future<ActionResult<List<Product>>> getProducts() async {
    emit(state.copyWith(products: const Loading()));

    var response = await _productRepository.getAllProducts(null).run();

    return response.fold(
      (l) {
        emit(state.copyWith(products: Failure(l)));
        return Failure(l);
      },
      (r) {
        emit(state.copyWith(products: Success(r)));
        return Success(r);
      },
    );
  }

  Future<ActionResult<List<Product>>> getProductByCategory(
      String categorySlug) async {
    emit(state.copyWith(products: const Loading()));

    var response = await _productRepository
        .getProductsByCategory(null, categorySlug: categorySlug)
        .run();

    return response.fold(
      (l) {
        emit(state.copyWith(products: Failure(l)));
        return Failure(l);
      },
      (r) {
        emit(state.copyWith(products: Success(r)));
        return Success(r);
      },
    );
  }

  void onCategorySelected(Category category) {
    emit(state.copyWith(selectedCategory: category));
    getProductByCategory(category.slug);
  }
}
