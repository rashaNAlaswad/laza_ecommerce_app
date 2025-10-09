import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              width: double.infinity,
              product.coverPictureUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.lightGray,
                  child: Icon(
                    Icons.image_not_supported,
                    color: AppColors.gray,
                    size: 80.sp,
                  ),
                );
              },
            ),
          ),
        ),
        verticalSpace(5),
        Text(
          product.name,
          style: AppTextStyles.font15blackMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        verticalSpace(2),
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: AppTextStyles.font15blackMedium.copyWith(
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
      ],
    );
  }
}
