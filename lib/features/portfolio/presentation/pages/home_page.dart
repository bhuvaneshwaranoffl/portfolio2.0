import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:portfolio/features/portfolio/presentation/bloc/portfolio_state.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/custom_nav_bar.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/sections/about_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/sections/contact_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/sections/experience_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/sections/hero_section.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/sections/projects_section.dart';
import 'package:portfolio/features/portfolio/presentation/widgets/sections/skills_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, GlobalKey> sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Skills': GlobalKey(),
    'Projects': GlobalKey(),
    'Experience': GlobalKey(),
    'Contact': GlobalKey(),
  };

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
        backgroundColor: AppColors.background.withOpacity(0.95),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
          children: sectionKeys.keys.map((String title) {
            return ListTile(
              title: Text(title, style: AppTextStyles.headingSmall),
              onTap: () {
                Navigator.pop(context); // Close drawer first
                if (sectionKeys[title]?.currentContext != null) {
                   Scrollable.ensureVisible(
                     sectionKeys[title]!.currentContext!,
                     duration: const Duration(milliseconds: 600),
                     curve: Curves.easeInOut,
                   );
                }
              },
            );
          }).toList(),
        ),
      ),
      body: BlocBuilder<PortfolioBloc, PortfolioState>(
        builder: (context, state) {
          if (state is PortfolioLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PortfolioError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is PortfolioLoaded) {
            return Stack(
              children: [
                // Parallax Background
                AnimatedBuilder(
                  animation: _scrollController,
                  builder: (context, child) {
                    double offset = _scrollController.hasClients ? _scrollController.offset : 0;
                    return Positioned(
                      top: -(offset * 0.4), // Parallax scroll speed
                      left: 0,
                      right: 0,
                      bottom: -2000, // Extra space to never run out of background
                      child: Opacity(
                        opacity: 0.1,
                        child: Image.asset(
                          'assets/images/skill_3.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    );
                  },
                ),
                
                // Foreground content
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      HeroSection(key: sectionKeys['Home']),
                      AboutSection(key: sectionKeys['About']),
                      SkillsSection(
                        key: sectionKeys['Skills'],
                        skills: state.skills,
                      ),
                      ProjectsSection(
                        key: sectionKeys['Projects'],
                        projects: state.projects,
                      ),
                      ExperienceSection(
                        key: sectionKeys['Experience'],
                        experiences: state.experiences,
                      ),
                      ContactSection(key: sectionKeys['Contact']),
                    ],
                  ),
                ),
                
                // Sticky Nav Bar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CustomNavBar(sectionKeys: sectionKeys),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
