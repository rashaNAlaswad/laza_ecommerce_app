part of 'login_cubit.dart';

sealed class LoginState {
  const LoginState();
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResult loginResult;
  const LoginSuccess(this.loginResult);
}

class LoginFailure extends LoginState {
  final ApiErrorModel error;
  const LoginFailure(this.error);
}
