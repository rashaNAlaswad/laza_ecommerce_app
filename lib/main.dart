import 'package:flutter/widgets.dart';

import 'app.dart';
import 'core/router/app_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ScreenUtil.ensureScreenSize();

  runApp(MainApp(appRouter: AppRouter()));
}
