import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_elevated_button.dart';
import '../cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AppElevatedButton(
          buttonText: state is LoginLoading ? 'Logging in...' : 'Login',
          onPressed: state is LoginLoading
              ? null
              : () => context.read<LoginCubit>().login(),
        );
      },
    );
  }
}
