import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helper/spacing.dart';

class ProductDetailsLoadingView extends StatelessWidget {
  const ProductDetailsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 460.h,
              width: double.infinity,
              color: Colors.white,
            ),
            verticalSpace(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 30.h, width: 200.w, color: Colors.white),
                  verticalSpace(10),
                  Container(height: 20.h, width: 150.w, color: Colors.white),
                  verticalSpace(15),
                  Container(height: 20.h, width: 100.w, color: Colors.white),
                  verticalSpace(10),
                  Container(
                    height: 15.h,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  verticalSpace(5),
                  Container(
                    height: 15.h,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  verticalSpace(5),
                  Container(height: 15.h, width: 200.w, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
