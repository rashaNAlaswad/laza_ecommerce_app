import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/api_error_model.dart';
import '../../domain/entities/verify_email_request.dart';
import '../../domain/repositories/verify_email_repository.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final VerifyEmailRepository _verifyEmailRepository;

  VerifyEmailCubit(this._verifyEmailRepository) : super(VerifyEmailInitial());

  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get otpController => _otpController;

  Future<void> verifyEmail(String email) async {
    if (!_formKey.currentState!.validate()) return;
    emit(VerifyEmailLoading());

    final verifyEmailRequest = VerifyEmailRequest(
      email: email,
      otp: _otpController.text.trim(),
    );
    final result = await _verifyEmailRepository.verifyEmail(verifyEmailRequest);
    result.when(
      success: (_) => emit(VerifyEmailSuccess()),
      failure: (error) => emit(VerifyEmailFailure(error)),
    );
  }

  Future<void> resendOtp(String email) async {
    emit(VerifyEmailResending());

    final result = await _verifyEmailRepository.resendOtp(email);
    result.when(
      success: (_) => emit(VerifyEmailResendSuccess()),
      failure: (error) => emit(VerifyEmailResendFailure(error)),
    );
  }
}
