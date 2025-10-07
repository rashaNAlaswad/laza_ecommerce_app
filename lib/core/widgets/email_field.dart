import 'package:flutter/material.dart';

import '../helper/validators.dart';
import '../theme/app_colors.dart';
import 'app_text_form_field.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key, this.controller, this.validator});

  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  bool _hasEmailText = false;
  bool _isEmailValid = false;

  void _onEmailChanged(String value) {
    setState(() {
      _hasEmailText = value.isNotEmpty;
      _isEmailValid = Validators.validateEmail(value) == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppTextFormField(
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: TextInputType.emailAddress,
          onChanged: _onEmailChanged,
        ),
        if (_hasEmailText)
          Positioned(
            top: 8,
            right: 8,
            child: _isEmailValid
                ? const Icon(Icons.check, color: AppColors.green, size: 20)
                : const Icon(Icons.close, color: AppColors.red, size: 20),
          ),
      ],
    );
  }
}
