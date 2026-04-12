import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 100),
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Gradient / Glow Parallax effect relative
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: isMobile ? 300 : 400,
              height: isMobile ? 300 : 400,
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
                        fontSize: isMobile ? 18 : 24,
                      ),
                    ).animate().fade(duration: 500.ms).slideY(begin: 0.3),
                    const SizedBox(height: 20),
                    Text(
                      'Flutter Developer.\nAPI Builder.\nSystem Thinker.',
                      style: (isMobile ? AppTextStyles.headingMedium : AppTextStyles.headingLarge).copyWith(
                        height: 1.1,
                      ),
                    ).animate(delay: 300.ms).fade(duration: 800.ms).slideX(begin: -0.2),
                    const SizedBox(height: 30),
                    Text(
                      'I build scalable apps, systems, and digital experiences.',
                      style: AppTextStyles.bodyLarge.copyWith(
                        fontSize: isMobile ? 16 : 18,
                      ),
                    ).animate(delay: 600.ms).fade().slideY(begin: 0.2),
                    const SizedBox(height: 40),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
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
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                    child: Image.asset(
                      'assets/images/skill_1.png',
                      width: 500,
                      fit: BoxFit.contain,
                    )
                    .animate(onPlay: (controller) => controller.repeat(reverse: true))
                    .fade(duration: 1.seconds)
                    .slideY(begin: -0.05, end: 0.05, curve: Curves.easeInOut, duration: 3.seconds),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
