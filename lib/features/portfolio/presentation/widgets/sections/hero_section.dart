import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.w : 40.w, vertical: 100.h),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Gradient / Glow Parallax effect relative
          Positioned(
            top: -100.h,
            left: -100.w,
            child: Container(
              width: (isMobile ? 300 : 400).w,
              height: (isMobile ? 300 : 400).w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            )
            .animate(onPlay: (controller) => controller.repeat(reverse: true))
            .blur(begin: const Offset(100, 100), end: const Offset(150, 150), duration: 5.seconds)
            .fade(duration: 3.seconds)
            .scale(begin: const Offset(0.8, 0.8), end: const Offset(1.2, 1.2), duration: 5.seconds),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Fix for mobile layout 
                  children: [
                    Text(
                      'Hello, I am Bhuvaneshwaran.',
                      style: AppTextStyles.headingSmall.copyWith(
                        color: AppColors.primary,
                        fontSize: isMobile ? 18.sp : 24.sp,
                      ),
                    ).animate().fade(duration: 500.ms).slideY(begin: 0.3),
                    SizedBox(height: 20.h),
                    Text(
                      'Flutter Developer.\nAPI Builder.\nSystem Thinker.',
                      style: (isMobile ? AppTextStyles.headingMedium : AppTextStyles.headingLarge).copyWith(
                        height: 1.1,
                      ),
                    ).animate(delay: 300.ms).fade(duration: 800.ms).slideX(begin: -0.2),
                    SizedBox(height: 30.h),
                    Text(
                      'I build scalable apps, systems, and digital experiences.',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: isMobile ? 16.sp : 18.sp,
                      ),
                    ).animate(delay: 600.ms).fade().slideY(begin: 0.2),
                    SizedBox(height: 40.h),
                    Wrap(
                      spacing: 20.w,
                      runSpacing: 20.h,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('View Projects'),
                        ).animate(delay: 900.ms).scale(),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.secondary,
                            side: const BorderSide(color: AppColors.secondary),
                            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                            textStyle: AppTextStyles.button,
                          ),
                          child: const Text('Contact Me'),
                        ).animate(delay: 1100.ms).scale(),
                      ],
                    ),
                  ],
                ),
              ),
              if (!isMobile)
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.secondary.withOpacity(0.3),
                            blurRadius: 100.r,
                            spreadRadius: 10.r,
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(500.r), // Circle Avatar mask
                        child: Image.asset(
                          'assets/images/me.png',
                          width: 450.w,
                          height: 450.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Image.asset(
                            'assets/images/skill_1.png', // Dynamic Fallback if missing
                            width: 450.w,
                            height: 450.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .fade(duration: 1.seconds)
                    .slideY(begin: -0.02, end: 0.02, curve: Curves.easeInOut, duration: 4.seconds),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
