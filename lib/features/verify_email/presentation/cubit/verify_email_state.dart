part of 'verify_email_cubit.dart';

sealed class VerifyEmailState {
  const VerifyEmailState();
}

class VerifyEmailInitial extends VerifyEmailState {}

class VerifyEmailLoading extends VerifyEmailState {}

class VerifyEmailSuccess extends VerifyEmailState {
  const VerifyEmailSuccess();
}

class VerifyEmailFailure extends VerifyEmailState {
  final ApiErrorModel error;
  const VerifyEmailFailure(this.error);
}

class VerifyEmailResending extends VerifyEmailState {}

class VerifyEmailResendSuccess extends VerifyEmailState {
  const VerifyEmailResendSuccess();
}

class VerifyEmailResendFailure extends VerifyEmailState {
  final ApiErrorModel error;
  const VerifyEmailResendFailure(this.error);
}
