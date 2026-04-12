import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary),
          ).animate().fade(duration: 500.ms).slideY(begin: 0.2),
          const SizedBox(height: 40),
          Text(
            'I am a builder at heart. I specialize in crafting high-performance, scalable systems and premium user experiences. From complex backend architectures to fluid frontend animations, I bridge the gap between design and deep technical execution. I don\'t just write code; I build products.',
            style: AppTextStyles.bodyLarge,
          ).animate(delay: 200.ms).fade(duration: 600.ms),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth > 800 ? 3 : (constraints.maxWidth > 500 ? 2 : 1);
              return GridView.count(
                crossAxisCount: columns,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 2.5,
                children: [
                  _buildAboutCard('Flutter Development', Icons.phone_android),
                  _buildAboutCard('Backend APIs (Node.js)', Icons.api),
                  _buildAboutCard('Deployment & Systems', Icons.cloud),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAboutCard(String title, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderColor),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondary, size: 40),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.headingSmall,
            ),
          ),
        ],
      ),
    ).animate().fade().scale(delay: 400.ms);
  }
}
