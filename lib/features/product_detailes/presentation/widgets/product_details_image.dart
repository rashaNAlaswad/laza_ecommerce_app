import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/product_detailes.dart';

class ProductDetailsImage extends StatelessWidget {
  const ProductDetailsImage({super.key, required this.productDetails});

  final ProductDetailes productDetails;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [_productImage(), _backButton(context)]);
  }

  SizedBox _productImage() {
    return SizedBox(
      height: 460.h,
      width: double.infinity,
      child: CachedNetworkImage(
        imageUrl: productDetails.coverPictureUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) {
          return const Center(child: CircularProgressIndicator());
        },
        errorWidget: (context, url, error) {
          return Center(
            child: Icon(
              Icons.image_not_supported,
              color: AppColors.gray,
              size: 80.sp,
            ),
          );
        },
      ),
    );
  }

  Positioned _backButton(BuildContext context) {
    return Positioned(
      left: 20.w,
      top: 45.h,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          padding: EdgeInsets.all(8.w),
          child: SvgPicture.asset(AppIcons.backArrow),
        ),
      ),
    );
  }
}
