import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/application/_application.dart';
import 'package:mobile_application/feature/cart/application/model/cart_product_dto.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';
import 'package:fpdart/fpdart.dart';

final class DummyCartService implements ICartService {
  final IApiService _apiService;

  DummyCartService({required IApiService apiService})
      : _apiService = apiService;
  @override
  TaskEither<Exception, void> addUpdateProduct({
    required CartRequest cartRequest,
    required String accessToken,
  }) {
    return _apiService
        .addNewCart(
          cartRequest: cartRequest.toMap(),
          accessToken: accessToken,
        )
        .map(
          (r) {},
        );
  }

  @override
  TaskEither<Exception, CartDto> getCart(
      {required CartRequest cartRequest, required String accessToken}) {
    return _apiService
        .addNewCart(
          cartRequest: cartRequest.toMap(),
          accessToken: accessToken,
        )
        .map(
          (r) => _cartDtoMapper(r),
        );
  }

  @override
  TaskEither<Exception, void> removeProduct({
    required CartRequest cartRequest,
    required String accessToken,
  }) {
    return _apiService.addNewCart(
      cartRequest: cartRequest.toMap(),
      accessToken: accessToken,
    );
  }

  CartDto _cartDtoMapper(Map<String, dynamic> r) {
    return CartDto(
      identifier: r['id'],
      userId: r['userId'],
      productQuantity: r['totalQuantity'],
      totalProductCount: r['totalProducts'],
      price: r['total'],
      discountedPrice: r['discountedTotal'],
      products: (r['products'] as List<dynamic>)
          .map((p) => CartProductDto(
                identifier: p['id'],
                title: p['title'],
                price: p['price'],
                quantity: p['quantity'],
                totalPrice: p['total'],
                discountPercentage: p['discountPercentage'] * 1.0,
                discountedTotalPrice: p['discountedPrice'],
                thumbnail: p['thumbnail'],
              ))
          .toList(),
    );
  }
}
