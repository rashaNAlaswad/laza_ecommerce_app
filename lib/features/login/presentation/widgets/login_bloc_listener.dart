import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/navigation_extensions.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/utils.dart';
import '../cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading ||
          current is LoginSuccess ||
          current is LoginFailure,
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(color: AppColors.purplePrimary),
            ),
          );
        } else if (state is LoginSuccess) {
          context.pop();
          // TODO: Navigate to home screen
        } else if (state is LoginFailure) {
          context.pop();
          Utils.setupErrorDialog(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
