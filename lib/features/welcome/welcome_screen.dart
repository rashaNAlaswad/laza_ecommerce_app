import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/helper/navigation_extensions.dart';
import '../../core/constants/app_assets.dart';
import '../../core/helper/spacing.dart';
import '../../core/router/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purplePrimary,
      body: Stack(children: [const WelcomeBackground(), WelcomeBottomSheet()]),
    );
  }
}

class WelcomeBackground extends StatelessWidget {
  const WelcomeBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Image.asset(AppImages.welcomeMan, fit: BoxFit.contain),
    );
  }
}

class WelcomeBottomSheet extends StatelessWidget {
  const WelcomeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom + 20,
      left: 20,
      right: 20,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: const WelcomeButtons(),
      ),
    );
  }
}

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Look Good, Feel Good', style: AppTextStyles.font24blackSemiBold),
        SizedBox(height: 20.h),
        AppElevatedButton(
          buttonText: 'Login',
          buttonHeight: 60.h,
          borderRadius: 16.r,
          onPressed: () {
            context.pushNamed(Routes.login);
          },
        ),
        verticalSpace(20),
        AppElevatedButton(
          buttonText: 'Signin',
          backgroundColor: AppColors.lightGray,
          buttonHeight: 60.h,
          borderRadius: 16.r,
          buttonTextStyle: AppTextStyles.font17whiteMedium.copyWith(
            color: AppColors.gray,
          ),
          onPressed: () {
            context.pushNamed(Routes.signup);
          },
        ),
      ],
    );
  }
}
