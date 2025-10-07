import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class RememberMeToggle extends StatefulWidget {
  const RememberMeToggle({super.key});

  @override
  State<RememberMeToggle> createState() => _RememberMeToggleState();
}

class _RememberMeToggleState extends State<RememberMeToggle> {
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Remember me',
          style: AppTextStyles.font15grayRegular.copyWith(
            color: AppColors.black,
          ),
        ),
        Switch(
          value: _isRememberMe,
          onChanged: (value) {
            setState(() {
              _isRememberMe = value;
            });
          },
          activeThumbColor: AppColors.green,
          activeTrackColor: AppColors.green.withValues(alpha: 0.3),
          inactiveThumbColor: AppColors.gray,
          inactiveTrackColor: AppColors.gray.withValues(alpha: 0.3),
        ),
      ],
    );
  }
}
