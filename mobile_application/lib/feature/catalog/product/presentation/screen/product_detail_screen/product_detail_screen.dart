import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_application/feature/catalog/product/presentation/content/product_detail/product_detail_content.dart';
import 'package:mobile_application/feature/catalog/product/presentation/screen/product_detail_screen/controller/product_detail_cubit.dart';
import 'package:mobile_application/feature/catalog/product/presentation/screen/product_detail_screen/controller/product_detail_state.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  const ProductDetailScreen({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailCubit cb;

  @override
  void initState() {
    cb = ProductDetailCubit(productId: widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => cb,
      child: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        bloc: cb,
        builder: (context, state) {
          return ProductDetailContent(
            productResult: state.product,
          );
        },
      ),
    );
  }
}
