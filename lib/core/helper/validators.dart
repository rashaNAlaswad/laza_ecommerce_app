import 'app_regex.dart';

class Validators {
  Validators._();

  static String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) return 'Email is required';
    return AppRegex.isEmailValid(value!)
        ? null
        : 'Please enter a valid email address';
  }

  static String? validatePassword(String? value) {
    if (value?.isEmpty ?? true) return 'Password is required';
    return AppRegex.isPasswordValid(value!)
        ? null
        : 'Password must contain at least 8 characters with:\nuppercase, lowercase,\nnumber and special character';
  }

  static String? validateName(String? value) {
    if (value?.isEmpty ?? true) return 'Name is required';
    return value!.length < 3 ? 'Name must be at least 3 characters' : null;
  }
}
