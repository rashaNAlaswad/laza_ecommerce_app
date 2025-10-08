import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_elevated_button.dart';
import '../cubit/verify_email_cubit.dart';

class VerificationButton extends StatelessWidget {
  final String email;
  const VerificationButton({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
      builder: (context, state) {
        return AppElevatedButton(
          buttonText: state is VerifyEmailLoading
              ? 'Verifying...'
              : 'Confirm Code',
          onPressed: state is VerifyEmailLoading
              ? null
              : () => context.read<VerifyEmailCubit>().verifyEmail(email),
        );
      },
    );
  }
}
