import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/helper/validators.dart';
import '../../../../core/widgets/app_title_form_field.dart';
import '../../../../core/widgets/email_field.dart';
import '../../../../core/widgets/password_field.dart';
import '../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
