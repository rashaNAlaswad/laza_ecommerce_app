import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/product_detailes_cubit.dart';
import '../cubit/product_detailes_state.dart';
import '../widgets/product_details_error_view.dart';
import '../widgets/product_details_loading_view.dart';
import '../widgets/product_details_success_view.dart';

class ProductDetailesScreen extends StatelessWidget {
  const ProductDetailesScreen({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductDetailesCubit, ProductDetailesState>(
        builder: (context, state) {
          switch (state) {
            case ProductDetailesLoading():
              return const ProductDetailsLoadingView();
            case ProductDetailesSuccess():
              return ProductDetailsSuccessView(
                productDetails: state.productDetailes,
              );
            case ProductDetailesFailure():
              return ProductDetailsErrorView(error: state.error);
            default:
              return const ProductDetailsLoadingView();
          }
        },
      ),
    );
  }
}
