import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class CustomNavBar extends StatelessWidget {
  final Map<String, GlobalKey> sectionKeys;

  const CustomNavBar({super.key, required this.sectionKeys});

  void _scrollTo(BuildContext context, GlobalKey key) {
    if (key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 30 : 50.w, // Dynamic fallback to absolute raw size
            vertical: isMobile ? 20 : 20.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.35), // Glass frost transparency
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.08), // Sleek subtle border boundary
                width: 1,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Bhuvaneshwaran.',
                style: AppTextStyles.headingSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  // Raw sizing overrides flutter_screenutil compression on mobile domains
                  fontSize: isMobile ? 24 : 26.sp, 
                ),
              ),
              if (isMobile)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.menu_rounded, color: AppColors.textPrimary),
                    iconSize: 32, // Absolute size, preventing sp shrinkage
                    padding: const EdgeInsets.all(8),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                )
              else
                Row(
                  children: sectionKeys.keys.map((String title) {
                    return Padding(
                      padding: EdgeInsets.only(left: 30.w),
                      child: TextButton(
                        onPressed: () => _scrollTo(context, sectionKeys[title]!),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        child: Text(
                          title,
                          style: AppTextStyles.button.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
