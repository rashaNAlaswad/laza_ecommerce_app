import 'package:flutter/material.dart';
import '../helper/app_regex.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'app_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.controller,
    this.validator,
    this.onChanged,
    this.showStrengthIndicator = true,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final bool showStrengthIndicator;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordObscured = true;
  String _passwordStrength = '';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppTextFormField(
          controller: widget.controller,
          validator: widget.validator,
          isObscureText: _isPasswordObscured,
          onChanged: (value) {
            if (widget.showStrengthIndicator) {
              setState(() {
                _passwordStrength = _calculatePasswordStrength(value);
              });
            }
            widget.onChanged?.call(value);
          },
        ),
        if (widget.showStrengthIndicator && _passwordStrength.isNotEmpty)
          Positioned(
            top: 8,
            right: 50,
            child: Text(
              _passwordStrength,
              style: AppTextStyles.font15grayRegular.copyWith(
                color: _getStrengthColor(_passwordStrength),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _isPasswordObscured = !_isPasswordObscured;
              });
            },
            child: Icon(
              _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
              color: AppColors.gray,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  String _calculatePasswordStrength(String password) {
    if (password.isEmpty) return '';
    if (password.length < 6) return 'Weak';
    if (password.length >= 8 && AppRegex.isPasswordValid(password)) {
      return 'Strong';
    }
    return 'Medium';
  }

  Color _getStrengthColor(String strength) {
    switch (strength) {
      case 'Strong':
        return AppColors.green;
      case 'Medium':
        return AppColors.orange;
      case 'Weak':
        return AppColors.red;
      default:
        return AppColors.gray;
    }
  }
}
