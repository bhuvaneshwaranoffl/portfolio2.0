import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Let\'s build something impactful.',
            style: isMobile ? AppTextStyles.headingMedium : AppTextStyles.headingLarge,
            textAlign: TextAlign.center,
          ).animate().fade().scale(),
          SizedBox(height: 40.h),
          Container(
            width: 600.w,
            padding: EdgeInsets.all(40.w),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: AppColors.borderColor),
            ),
            child: Column(
              children: [
                _buildTextField('Name'),
                SizedBox(height: 20.h),
                _buildTextField('Email'),
                SizedBox(height: 20.h),
                _buildTextField('Message', maxLines: 5),
                SizedBox(height: 30.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 60.h),
                  ),
                  child: const Text('Send Message'),
                ),
              ],
            ),
          ).animate().slideY(begin: 0.2, delay: 300.ms).fade(),
          SizedBox(height: 80.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.link, 'LinkedIn'),
              SizedBox(width: 20.w),
              _buildSocialIcon(Icons.code, 'GitHub'),
            ],
          ).animate().fade(delay: 600.ms),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textSecondary),
        filled: true,
        fillColor: AppColors.background.withOpacity(0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.borderColor),
          color: AppColors.surfaceHover,
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 24.sp),
      ),
    );
  }
}
