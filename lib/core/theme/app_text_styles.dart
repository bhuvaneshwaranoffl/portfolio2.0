import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  // Headings
  static TextStyle get headingLarge => GoogleFonts.inter(
    fontSize: 56.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  static TextStyle get headingMedium => GoogleFonts.inter(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );
  
  static TextStyle get headingSmall => GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  // Body
  static TextStyle get bodyLarge => GoogleFonts.inter(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Caption
  static TextStyle get caption => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
    color: AppColors.textSecondary,
    height: 1.5,
  );
  
  static TextStyle get button => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );
}
