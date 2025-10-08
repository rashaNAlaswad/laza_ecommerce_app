import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/navigation_extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/utils.dart';
import '../cubit/signup_cubit.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is SignupLoading ||
          current is SignupSuccess ||
          current is SignupFailure,
      listener: (context, state) {
        if (state is SignupLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColors.purplePrimary),
            ),
          );
        } else if (state is SignupSuccess) {
          context.pop();
          navigateToVerifyEmail(context);
        } else if (state is SignupFailure) {
          context.pop();
          Utils.setupErrorDialog(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void navigateToVerifyEmail(BuildContext context) {
    final email = context.read<SignupCubit>().emailController.text.trim();
    context.pushNamed(Routes.verifyEmail, arguments: email);
  }
}
