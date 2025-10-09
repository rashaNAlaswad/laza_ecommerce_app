import 'package:flutter/material.dart';
import 'package:laza_ecommerce_app/core/helper/spacing.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/product.dart';
import 'category_item.dart';
import 'products_item.dart';

class HomeSuccessView extends StatelessWidget {
  final List<Category> categories;
  final List<Product> products;

  const HomeSuccessView({
    super.key,
    required this.categories,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text('Hello', style: AppTextStyles.font28blackSemiBold),
        ),
        SliverToBoxAdapter(child: verticalSpace(5)),
        SliverToBoxAdapter(
          child: Text(
            'Welcome to Laza.',
            style: AppTextStyles.font15grayRegular,
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(
          child: Text(
            'Categories',
            style: AppTextStyles.font17whiteMedium.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(15)),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryItem(category: category);
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(15)),
        SliverToBoxAdapter(
          child: Text(
            'Products',
            style: AppTextStyles.font17whiteMedium.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(15)),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          delegate: SliverChildBuilderDelegate((context, index) {
            final product = products[index];
            return ProductItem(product: product);
          }, childCount: products.length),
        ),
      ],
    );
  }
}
