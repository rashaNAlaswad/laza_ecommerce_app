import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza_ecommerce_app/core/helper/navigation_extensions.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/signup_button.dart';

import '../widgets/signup_bloc_listener.dart';
import '../widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: SvgPicture.asset(AppIcons.backArrow, width: 24.w, height: 24.h),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 40,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Sign Up',
                      style: AppTextStyles.font24blackSemiBold,
                      textAlign: TextAlign.center,
                    ),
                    SignupForm(),
                    SignupBlocListener(),
                  ],
                ),
              ),
            ),
          ),
          const SignupButton(),
        ],
      ),
    );
  }
}
