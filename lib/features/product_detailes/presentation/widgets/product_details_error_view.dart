import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProductDetailsErrorView extends StatelessWidget {
  final ApiErrorModel error;

  const ProductDetailsErrorView({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 80, color: Colors.red),
            verticalSpace(16),
            Text(
              'Failed to load product',
              style: AppTextStyles.font17whiteMedium.copyWith(
                color: Colors.black,
              ),
            ),
            verticalSpace(8),
            Text(
              error.message ?? 'An unexpected error occurred',
              style: AppTextStyles.font15grayRegular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
