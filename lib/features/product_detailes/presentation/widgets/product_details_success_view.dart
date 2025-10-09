import 'package:flutter/material.dart';

import '../../domain/entities/product_detailes.dart';
import 'add_to_cart_button.dart';
import 'product_details_image.dart';
import 'product_details_info.dart';

class ProductDetailsSuccessView extends StatelessWidget {
  const ProductDetailsSuccessView({super.key, required this.productDetails});

  final ProductDetailes productDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDetailsImage(productDetails: productDetails),
                ProductDetailsInfo(productDetails: productDetails),
              ],
            ),
          ),
        ),
        AddToCartButton(),
      ],
    );
  }
}
