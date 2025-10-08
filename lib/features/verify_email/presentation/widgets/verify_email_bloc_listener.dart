import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/navigation_extensions.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/utils/utils.dart';
import '../cubit/verify_email_cubit.dart';

class VerifyEmailBlocListener extends StatelessWidget {
  const VerifyEmailBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listenWhen: (previous, current) =>
          current is VerifyEmailLoading ||
          current is VerifyEmailSuccess ||
          current is VerifyEmailFailure ||
          current is VerifyEmailResending ||
          current is VerifyEmailResendFailure,
      listener: (context, state) {
        if (state is VerifyEmailLoading) {
          Utils.showLoadingDialog(context);
        } else if (state is VerifyEmailSuccess) {
          context.pop();
          context.pushNamedAndRemoveUntil(
            Routes.login,
            predicate: (route) => false,
          );
        } else if (state is VerifyEmailFailure) {
          context.pop();
          Utils.setupErrorDialog(context, state.error);
        } else if (state is VerifyEmailResendFailure) {
          Utils.setupErrorDialog(context, state.error);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
