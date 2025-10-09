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
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productDetails.categories.join(", "),
            style: AppTextStyles.font15grayRegular,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          verticalSpace(8),
          Row(
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
              Text(
                '\$${productDetails.price.toStringAsFixed(2)}',
                style: AppTextStyles.font22blackSemiBold,
              ),
            ],
          ),
          verticalSpace(10),
          Text(
            'Description',
            style: AppTextStyles.font22blackSemiBold.copyWith(fontSize: 17),
          ),
          verticalSpace(10),
          Text(
            productDetails.description,
            style: AppTextStyles.font15grayRegular,
          ),

          verticalSpace(10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _buildInfoChip('Stock: ${productDetails.stock}'),
              _buildInfoChip('Weight: ${productDetails.weight}kg'),
              _buildInfoChip('Color: ${productDetails.color}'),
              _buildInfoChip(
                'Rating: ${productDetails.rating.toStringAsFixed(1)}',
              ),
            ],
          ),
        ],
      ),
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
