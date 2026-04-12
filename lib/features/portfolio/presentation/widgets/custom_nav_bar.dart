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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      color: AppColors.background.withOpacity(0.9), // Glass effect base
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bhuvaneshwaran.',
            style: AppTextStyles.headingSmall.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (isMobile)
            IconButton(
              icon: Icon(Icons.menu, color: AppColors.textPrimary, size: 30.sp),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            )
          else
            Row(
              children: sectionKeys.keys.map((String title) {
                return Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: TextButton(
                    onPressed: () => _scrollTo(context, sectionKeys[title]!),
                    child: Text(
                      title,
                      style: AppTextStyles.button.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
