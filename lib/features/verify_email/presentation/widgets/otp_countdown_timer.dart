import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_ecommerce_app/core/helper/spacing.dart';
import 'package:laza_ecommerce_app/core/theme/app_font_weight.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../cubit/verify_email_cubit.dart';

class OtpCountdownTimer extends StatefulWidget {
  final String email;

  const OtpCountdownTimer({super.key, required this.email});

  @override
  State<OtpCountdownTimer> createState() => _OtpCountdownTimerState();
}

class _OtpCountdownTimerState extends State<OtpCountdownTimer> {
  int _remainingSeconds = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final canResend = _remainingSeconds == 0;

    return Column(
      children: [
        _buildTimerDisplay(),
        verticalSpace(8),
        _buildResendButton(context, canResend),
      ],
    );
  }

  Widget _buildTimerDisplay() {
    return RichText(
      text: TextSpan(
        text: _formatTime(_remainingSeconds),
        style: AppTextStyles.font17whiteMedium.copyWith(
          color: AppColors.purplePrimary,
          fontWeight: AppFontWeight.semiBold,
        ),
        children: [
          TextSpan(
            text: ' resend confirmation code.',
            style: AppTextStyles.font17whiteMedium.copyWith(
              color: AppColors.gray,
              fontWeight: AppFontWeight.regular,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResendButton(BuildContext context, bool canResend) {
    return BlocBuilder<VerifyEmailCubit, VerifyEmailState>(
      builder: (context, state) {
        final isResending = state is VerifyEmailResending;
        return TextButton(
          onPressed: canResend && !isResending
              ? () {
                  context.read<VerifyEmailCubit>().resendOtp(widget.email);
                  setState(() => _remainingSeconds = 120);
                  _startTimer();
                }
              : null,
          child: Text(
            isResending ? 'Resending...' : 'Resend Code',
            style: AppTextStyles.font15grayRegular.copyWith(
              color: canResend && !isResending
                  ? AppColors.purplePrimary
                  : AppColors.gray,
              fontWeight: AppFontWeight.semiBold,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      },
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
