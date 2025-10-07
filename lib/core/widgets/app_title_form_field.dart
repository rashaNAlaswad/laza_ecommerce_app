import 'package:flutter/cupertino.dart';

import '../theme/app_text_styles.dart';

class AppTitleFormField extends StatelessWidget {
  const AppTitleFormField({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.font15grayRegular);
  }
}
