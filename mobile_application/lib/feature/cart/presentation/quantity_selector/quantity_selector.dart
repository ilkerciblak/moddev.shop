// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_application/common/_common.dart';
import 'package:mobile_application/feature/cart/domain/_domain.dart';

class QuantitySelector extends StatefulWidget {
  final int productId;
  final void Function() onQuantityChanged;
  const QuantitySelector({
    super.key,
    required this.productId,
    required this.onQuantityChanged,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector>
    with QuantitySelectorServiceMixin {
  @override
  void initState() {
    quantity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isProductInCart,
      builder: (context, value, child) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            child: child,
          );
        },
        child: isProductInCart.value
            ? Column(
                children: [
                  IconButton.filled(
                      onPressed: () {
                        addUpdateProduct(quantity: productQuantity.value + 1);
                        quantity();
                      },
                      icon: const Icon(Icons.add)),
                  const Divider(),
                  ValueListenableBuilder(
                    valueListenable: productQuantity,
                    builder: (context, value, child) {
                      return Text(value.toString());
                    },
                  ),
                  const Divider(),
                  IconButton.filled(
                      onPressed: () {
                        addUpdateProduct(quantity: productQuantity.value - 1);
                        quantity();
                      },
                      icon: const Icon(Icons.remove)),
                ],
              )
            : IconButton.filled(
                onPressed: addUpdateProduct,
                icon: const Icon(Icons.add),
              ),
      ),
    );
  }
}

mixin QuantitySelectorServiceMixin<T extends StatefulWidget>
    on State<QuantitySelector> {
  final ICartRepository _cartRepository = GetIt.instance<ICartRepository>();
  ValueNotifier<bool> isProductInCart = ValueNotifier<bool>(false);
  ValueNotifier<int> productQuantity = ValueNotifier<int>(0);

  Future<int> quantity() async {
    return _cartRepository.getCart().run().then(
      (value) {
        return value.fold(
          (l) => 0,
          (r) {
            setState(() {
              productQuantity.value =
                  r.products.productQuantity(widget.productId);
            });
            isProductInCart.value = productQuantity.value > 0;
            return r.products.productQuantity(widget.productId);
          },
        );
      },
    );
  }

  Future<ActionResult<void>> addUpdateProduct({
    int quantity = 1,
  }) async {
    var response = await _cartRepository
        .addUpdateProduct(productId: widget.productId, quantity: quantity)
        .run();

    return response.fold(
      (l) {
        return Failure(l);
      },
      (r) {
        productQuantity.value = quantity;
        return const Success();
      },
    );
  }

  Future<ActionResult<void>> deleteProduct() async {
    var response =
        await _cartRepository.removeProduct(productId: widget.productId).run();
    return response.fold(
      (l) {
        return Failure(l);
      },
      (r) {
        return const Success();
      },
    );
  }
}

mixin QuantitySelectorWidgetMixin<T extends StatefulWidget>
    on State<QuantitySelector> {}
