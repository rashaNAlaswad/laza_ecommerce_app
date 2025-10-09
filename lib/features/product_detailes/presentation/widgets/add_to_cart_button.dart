import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_elevated_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppElevatedButton(
      buttonText: 'Add to Cart',
      buttonTextStyle: AppTextStyles.font17whiteMedium,
      onPressed: () {},
    );
  }
}
