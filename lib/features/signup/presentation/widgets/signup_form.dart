import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/validators.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../core/widgets/app_title_form_field.dart';
import '../../../../core/widgets/email_field.dart';
import '../../../../core/widgets/password_field.dart';
import '../cubit/signup_cubit.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitleFormField(title: 'First Name'),
          verticalSpace(8),
          AppTextFormField(
            controller: cubit.firstNameController,
            validator: Validators.validateName,
          ),
          verticalSpace(20),
          AppTitleFormField(title: 'Last Name'),
          verticalSpace(8),
          AppTextFormField(
            controller: cubit.lastNameController,
            validator: Validators.validateName,
          ),
          verticalSpace(20),
          AppTitleFormField(title: 'Email'),
          verticalSpace(8),
          EmailField(
            controller: cubit.emailController,
            validator: Validators.validateEmail,
          ),
          verticalSpace(20),
          AppTitleFormField(title: 'Password'),
          verticalSpace(8),
          PasswordField(
            controller: cubit.passwordController,
            validator: Validators.validatePassword,
          ),
        ],
      ),
    );
  }
}
