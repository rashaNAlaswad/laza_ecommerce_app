import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/signup_button.dart';

import '../widgets/signup_bloc_listener.dart';
import '../widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Sign Up',
              style: AppTextStyles.font24blackSemiBold,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SignupForm(),
            ),
            SignupBlocListener(),
          ],
        ),
      ),

      bottomNavigationBar: const SignupButton(),
    );
  }
}
