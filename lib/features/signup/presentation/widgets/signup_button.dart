import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_elevated_button.dart';
import '../cubit/signup_cubit.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return AppElevatedButton(
          buttonText: state is SignupLoading ? 'Signing Up...' : 'Sign Up',
          onPressed: state is SignupLoading
              ? null
              : () => context.read<SignupCubit>().signup(),
        );
      },
    );
  }
}
