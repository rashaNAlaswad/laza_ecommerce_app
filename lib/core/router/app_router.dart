import 'package:flutter/material.dart';

import '../../../features/login/presentation/screens/login_screen.dart';
import '../../../features/signup/presentation/screens/signup_screen.dart';
import '../../../features/welcome/welcome_screen.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
    }
    return null;
  }
}
