import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/product_detailes.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key, required this.productDetails});

  final ProductDetailes productDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategorySection(),
          verticalSpace(8),
          _buildNameAndPriceSection(),
          verticalSpace(15),
          _buildDescriptionSection(),
          verticalSpace(15),
          _buildInfoChipsSection(),
        ],
      ),
    );
  }

  Widget _buildCategorySection() {
    return Text(
      productDetails.categories.join(", "),
      style: AppTextStyles.font15grayRegular,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildNameAndPriceSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            productDetails.name,
            style: AppTextStyles.font22blackSemiBold,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        horizontalSpace(10),
        Text(
          '\$${productDetails.price.toStringAsFixed(2)}',
          style: AppTextStyles.font22blackSemiBold,
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: AppTextStyles.font17whiteMedium.copyWith(color: Colors.black),
        ),
        verticalSpace(10),
        Text(
          productDetails.description,
          style: AppTextStyles.font15grayRegular,
        ),
      ],
    );
  }

  Widget _buildInfoChipsSection() {
    return Wrap(
      spacing: 10.w,
      runSpacing: 10.h,
      children: [
        _buildInfoChip('Stock: ${productDetails.stock}'),
        _buildInfoChip('Weight: ${productDetails.weight}kg'),
        _buildInfoChip('Color: ${productDetails.color}'),
        _buildInfoChip('Rating:⭐ ${productDetails.rating.toStringAsFixed(1)} '),
      ],
    );
  }

  Widget _buildInfoChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(text, style: AppTextStyles.font15blackMedium),
    );
  }
}
