import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/shared_pref_keys.dart';
import '../../../../core/helper/shared_pref_helper.dart';
import '../../../../core/networking/api_error_model.dart';
import '../../../../core/networking/dio_factory.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/entities/login_result.dart';
import '../../domain/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;
  LoginCubit(this._loginRepository) : super(LoginInitial());

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;
    emit(LoginLoading());

    final loginRequest = LoginRequest(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    final result = await _loginRepository.login(loginRequest);
    result.when(
      success: (loginResult) async {
        await SecureStorageHelper().setSecuredString(
          SharedPrefKeys.userToken,
          loginResult.accessToken,
        );

        await SecureStorageHelper().setSecuredString(
          SharedPrefKeys.refreshToken,
          loginResult.refreshToken,
        );

        DioFactory.setAuthorizationHeader(loginResult.accessToken);

        emit(LoginSuccess(loginResult));
      },
      failure: (error) => emit(LoginFailure(error)),
    );
  }
}
