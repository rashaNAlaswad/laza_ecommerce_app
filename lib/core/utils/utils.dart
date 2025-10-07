import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helper/navigation_extensions.dart';
import '../networking/api_error_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class Utils {
  Utils._();

  static showDialogs(
    BuildContext context,
    Widget widget,
    Widget actions,
    bool? isDismissible,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
          content: widget,
          actions: [actions],
        );
      },
    );
  }

  static showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: CircularProgressIndicator(color: AppColors.purplePrimary),
      ),
    );
  }

  static void setupErrorDialog(
    BuildContext context,
    ApiErrorModel apiErrorModel,
  ) {
    Utils.showDialogs(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Icon(Icons.error, color: AppColors.red, size: 32),
          Text(
            apiErrorModel.getAllErrorMessages(),
            style: AppTextStyles.font15blackMedium,
          ),
        ],
      ),
      TextButton(
        onPressed: () {
          context.pop();
        },
        child: Text('حسنا', style: AppTextStyles.font15blackMedium),
      ),
      false,
    );
  }

  static void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppTextStyles.font15blackMedium.copyWith(
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        duration: const Duration(seconds: 3),
        padding: const EdgeInsets.all(24),
      ),
    );
  }
}
