import 'package:flutter/material.dart';

import '../../../../core/theme/app_font_weight.dart';
import '../../../../core/theme/app_text_styles.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By connecting your account confirm that you agree with our ',
            style: AppTextStyles.font15grayRegular,
          ),
          TextSpan(
            text: 'Term and Condition',
            style: AppTextStyles.font15grayRegular.copyWith(
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
