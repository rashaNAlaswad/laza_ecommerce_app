import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/theme/app_colors.dart';
import '../cubit/verify_email_cubit.dart';

class VerificationEmailForm extends StatelessWidget {
  const VerificationEmailForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<VerifyEmailCubit>();
    return Form(
      key: cubit.formKey,
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        controller: cubit.otpController,
        errorTextSpace: 25.h,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the verification code';
          }
          if (value.length != 6) {
            return 'The code must be 6 digits';
          }
          return null;
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(16),
          fieldHeight: 55.h,
          fieldWidth: 50.w,
          activeFillColor: Colors.transparent,
          inactiveFillColor: AppColors.white,
          selectedFillColor: AppColors.white,
          activeColor: AppColors.purplePrimary,
          inactiveColor: AppColors.gray,
          selectedColor: AppColors.purplePrimary,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        cursorColor: AppColors.purplePrimary,
        onChanged: (_) {},
        beforeTextPaste: (_) => true,
      ),
    );
  }
}
