part of 'signup_cubit.dart';

sealed class SignupState {
  const SignupState();
}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupSuccess extends SignupState {
  const SignupSuccess();
}

class SignupFailure extends SignupState {
  final ApiErrorModel error;
  const SignupFailure(this.error);
}
