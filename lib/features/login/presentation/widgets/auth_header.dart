import 'package:flutter/material.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.font24blackSemiBold,
          textAlign: TextAlign.center,
        ),
        if (subtitle != null) ...[
          verticalSpace(5),
          Text(
            subtitle!,
            style: AppTextStyles.font15grayRegular,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
