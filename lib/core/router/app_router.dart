import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/login/presentation/screens/login_screen.dart';
import '../../../features/signup/presentation/screens/signup_screen.dart';
import '../../../features/welcome/welcome_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/verify_email/presentation/screens/verify_email_screen.dart';
import '../../features/login/presentation/cubit/login_cubit.dart';
import '../../features/signup/presentation/cubit/signup_cubit.dart';
import '../../features/verify_email/presentation/cubit/verify_email_cubit.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case Routes.verifyEmail:
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => VerifyEmailCubit(getIt()),
            child: VerifyEmailScreen(email: email),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
    return null;
  }
}
