import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../widgets/otp_countdown_timer.dart';
import '../widgets/verification_button.dart';
import '../widgets/verification_email_form.dart';
import '../widgets/verify_email_bloc_listener.dart';

class VerifyEmailScreen extends StatelessWidget {
  final String email;
  const VerifyEmailScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Verification Code', style: AppTextStyles.font24blackSemiBold),
            verticalSpace(60),
            SvgPicture.asset(AppIcons.verifyCloud, height: 166.h),
            verticalSpace(30),
            const VerificationEmailForm(),
            verticalSpace(30),
            OtpCountdownTimer(email: email),
            const VerifyEmailBlocListener(),
          ],
        ),
      ),
      bottomSheet: VerificationButton(email: email),
    );
  }
}
