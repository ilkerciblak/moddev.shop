import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/catalog/product/domain/_domain.dart';
import 'package:mobile_application/presentation/catalog/product_detail/screen/controller/product_detail_state.dart';

final class ProductDetailCubit extends Cubit<ProductDetailState> {
  final IProductRepository _productRepository =
      GetIt.instance<IProductRepository>();

  final String productId;
  ProductDetailCubit({
    required this.productId,
  }) : super(ProductDetailState.initial()) {
    getProduct();
  }

  Future<ActionResult<Product>> getProduct() async {
    var response = await _productRepository
        .getProductById(
          productId: productId,
        )
        .run();

    return response.fold(
      (l) {
        emit(state.copyWith(product: Failure(l)));
        return Failure(l);
      },
      (r) {
        emit(state.copyWith(product: Success(r)));
        return Success(r);
      },
    );
  }
}
