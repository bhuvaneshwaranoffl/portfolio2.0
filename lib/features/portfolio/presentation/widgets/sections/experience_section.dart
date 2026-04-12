import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import '../../../domain/entities/experience.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Experience',
            style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary),
          ).animate().fade().slideY(),
          const SizedBox(height: 60),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return _buildExperienceItem(experiences[index], isLast: index == experiences.length - 1);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(Experience exp, {required bool isLast}) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
              ).animate().scale(delay: 300.ms).fade(),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppColors.borderColor,
                  ).animate().fadeIn(delay: 500.ms),
                ),
            ],
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exp.role, style: AppTextStyles.headingSmall),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(exp.company, style: AppTextStyles.button.copyWith(color: AppColors.primary)),
                      const SizedBox(width: 10),
                      Text('• ${exp.period}', style: AppTextStyles.caption),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(exp.description, style: AppTextStyles.bodyLarge),
                  const SizedBox(height: 16),
                  ...exp.achievements.map((ach) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('▹ ', style: TextStyle(color: AppColors.secondary, fontSize: 16)),
                            Expanded(child: Text(ach, style: AppTextStyles.bodyMedium)),
                          ],
                        ),
                      )),
                ],
              ),
            ).animate().slideX(begin: 0.1, delay: 200.ms).fade(),
          ),
        ],
      ),
    );
  }
}
