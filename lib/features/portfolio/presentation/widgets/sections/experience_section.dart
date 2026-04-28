import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/portfolio/domain/entities/experience.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 40.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary),
          ).animate().fade().slideY(),
          SizedBox(height: 60.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return _buildExperienceItem(experiences[index], isLast: index == experiences.length - 1)
                  .animate()
                  .fade(delay: (index * 200).ms, duration: 600.ms)
                  .slideX(begin: 0.1);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(Experience exp, {required bool isLast}) {
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            top: 16.r,
            bottom: 0,
            left: 8.r - 1.w, // Centers a 2.w line exactly below a 16.r dot
            child: Container(
              width: 2.w,
              color: AppColors.borderColor,
            ),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 4.h), // align dot visually with text header
              width: 16.r,
              height: 16.r,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.secondary.withOpacity(0.5),
                    spreadRadius: 2.r,
                    blurRadius: 10.r,
                  )
                ]
              ),
            ),
            SizedBox(width: 30.w),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: 60.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exp.role, style: AppTextStyles.headingSmall),
                    SizedBox(height: 8.h),
                    Wrap( // Wrap prevents overlap and RenderFlex overflow on small screens
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(exp.company, style: AppTextStyles.button.copyWith(color: AppColors.primary)),
                        SizedBox(width: 10.w),
                        Text('•  ${exp.period}', style: AppTextStyles.caption),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Text(exp.description, style: AppTextStyles.bodyLarge),
                    SizedBox(height: 16.h),
                    ...exp.achievements.map((ach) => Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('▹ ', style: TextStyle(color: AppColors.secondary, fontSize: 16.sp)),
                              Expanded(child: Text(ach, style: AppTextStyles.bodyMedium)),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
