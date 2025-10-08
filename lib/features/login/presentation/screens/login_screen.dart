import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../widgets/auth_header.dart';
import '../widgets/forgot_password_text.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/login_button.dart';
import '../widgets/login_form.dart';
import '../widgets/remember_me_toggle.dart';
import '../widgets/terms_and_conditions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(40),
              const AuthHeader(
                title: 'Welcome',
                subtitle: 'Please enter your data to continue',
              ),
              const Spacer(),
              const LoginForm(),
              verticalSpace(30),
              const Align(
                alignment: Alignment.centerRight,
                child: ForgotPasswordText(),
              ),
              verticalSpace(30),
              const RememberMeToggle(),
              const Spacer(),
              const TermsAndConditions(),
              const Spacer(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
      bottomSheet: const LoginButton(),
    );
  }
}
