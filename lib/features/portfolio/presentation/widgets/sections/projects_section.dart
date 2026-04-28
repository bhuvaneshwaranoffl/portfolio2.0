import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/theme/app_colors.dart';
import 'package:portfolio/core/theme/app_text_styles.dart';
import 'package:portfolio/features/portfolio/domain/entities/project.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const ProjectsSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              'Featured Projects',
              style: AppTextStyles.headingMedium.copyWith(color: AppColors.primary),
            ).animate().fade().slideY(),
          ),
          SizedBox(height: 60.h),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 650 ? 2 : 1);
              return GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  mainAxisSpacing: 30.h,
                  crossAxisSpacing: 30.w,
                  mainAxisExtent: 520.h, // Fixed relative height
                ),
                itemBuilder: (context, index) {
                  return _ProjectCard(project: projects[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _isHovered ? -15.0 : 0.0),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: _isHovered ? AppColors.primary : AppColors.borderColor,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    spreadRadius: 2.r,
                    blurRadius: 15.r,
                  )
                ]
              : [],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset(
                widget.project.imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.title,
                      style: AppTextStyles.headingSmall,
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: Text(
                        widget.project.description,
                        style: AppTextStyles.bodyMedium,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: widget.project.techStack.map((tech) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: AppColors.secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20.r),
                            border: Border.all(color: AppColors.secondary.withOpacity(0.5)),
                          ),
                          child: Text(
                            tech,
                            style: AppTextStyles.caption.copyWith(color: AppColors.secondary),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ).animate().scale(delay: 200.ms).fade(),
    );
  }
}
