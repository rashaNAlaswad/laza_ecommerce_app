import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'app_font_weight.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle font24blackSemiBold = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.black,
  );

  static TextStyle font15grayRegular = GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.regular,
    color: AppColors.gray,
  );

  static TextStyle font17whiteMedium = GoogleFonts.inter(
    fontSize: 17.sp,
    fontWeight: AppFontWeight.medium,
    color: AppColors.white,
  );

  static TextStyle font15blackMedium = GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: AppFontWeight.medium,
    color: AppColors.black,
  );

  static TextStyle font12redRegular = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: AppFontWeight.regular,
    color: AppColors.red,
  );
}
