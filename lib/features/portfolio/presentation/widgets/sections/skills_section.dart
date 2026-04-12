import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/portfolio/domain/entities/skill.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: isMobile ? 20 : 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: isMobile ? 0 : 20),
            child: Text(
              'Core Skills',
              style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary),
            ).animate().fade().slideY(),
          ),
          const SizedBox(height: 60),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skills.length,
            separatorBuilder: (context, index) => const SizedBox(height: 60),
            itemBuilder: (context, index) {
              final skill = skills[index];
              final bool isEven = index % 2 == 0;
              
              // Widget 1: Text
              final textContent = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(skill.title, style: AppTextStyles.headingSmall),
                  const SizedBox(height: 16),
                  Text(skill.description, style: AppTextStyles.bodyLarge),
                ],
              );
              
              // Widget 2: Image
              final imageContent = Center(
                child: Container(
                  height: isMobile ? 250 : null, // bounded height for mobile
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      skill.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ).animate(onPlay: (controller) => controller.repeat(reverse: true))
               .slideY(begin: isEven ? -0.02 : 0.02, end: isEven ? 0.02 : -0.02, duration: 4.seconds);

              // Mobile Layout (Stack layout prevents errors)
              if (isMobile) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    imageContent,
                    const SizedBox(height: 30),
                    textContent,
                  ],
                );
              }

              // Desktop Layout (Row uses Expanded)
              return Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: isEven ? [Expanded(child: textContent), const SizedBox(width: 40), Expanded(child: imageContent)]
                                  : [Expanded(child: imageContent), const SizedBox(width: 40), Expanded(child: textContent)],
              );
            },
          ),
        ],
      ),
    );
  }
}
