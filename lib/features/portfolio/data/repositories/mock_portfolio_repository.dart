import 'package:portfolio/features/portfolio/domain/entities/experience.dart';
import 'package:portfolio/features/portfolio/domain/entities/project.dart';
import 'package:portfolio/features/portfolio/domain/entities/skill.dart';

class MockPortfolioRepository {
  Future<List<Skill>> getSkills() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      Skill(
        id: '1',
        title: 'Flutter Development',
        description: 'Building native-quality mobile and web apps with smooth animations and clean architecture.',
        imageUrl: 'assets/images/skill_1.png',
      ),
      Skill(
        id: '2',
        title: 'Backend APIs (Node.js)',
        description: 'Designing scalable microservices, RESTful and GraphQL APIs, optimizing data flow.',
        imageUrl: 'assets/images/skill_2.png',
      ),
      Skill(
        id: '3',
        title: 'Deployment & Systems',
        description: 'Setting up automated CI/CD pipelines, cloud infrastructure, and modern DevOps practices.',
        imageUrl: 'assets/images/skill_3.png',
      ),
    ];
  }

  Future<List<Project>> getProjects() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return const [
      Project(
        id: '1',
        title: 'FinTech Dashboard',
        description: 'A responsive dashboard for financial analytics with real-time data streaming and complex charting.',
        imageUrl: 'assets/images/skill_2.png', // Fallback to skill image
        techStack: ['Flutter Web', 'Node.js', 'WebSockets', 'BLoC'],
      ),
      Project(
        id: '2',
        title: 'E-commerce App',
        description: 'A complete custom e-commerce solution featuring smooth transitions, cart management, and payment integration.',
        imageUrl: 'assets/images/skill_1.png',
        techStack: ['Flutter', 'Firebase', 'Stripe API'],
      ),
      Project(
        id: '3',
        title: 'Cloud DevOps Panel',
        description: 'Internal tool managing deployment pipelines and monitoring server health metrics.',
        imageUrl: 'assets/images/skill_3.png',
        techStack: ['Flutter Web', 'Docker', 'AWS'],
      ),
    ];
  }

  Future<List<Experience>> getExperience() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      Experience(
        id: '1',
        role: 'Senior System Thinker / Lead Developer',
        company: 'Startup Inc',
        period: '2022 - Present',
        description: 'Leading architecture decisions and building high-performance systems from the ground up.',
        achievements: [
          'Architected a highly scalable Flutter web application handling 10k+ daily users.',
          'Reduced API response times by 40% through Node.js optimizations.',
        ],
      ),
      Experience(
        id: '2',
        role: 'Flutter Developer & API Builder',
        company: 'Digital Agency',
        period: '2020 - 2022',
        description: 'Delivered multiple client products natively compiled for iOS, Android, and Web.',
        achievements: [
          'Built 5+ cross-platform apps using a single codebase.',
          'Implemented Clean Architecture resulting in 95% crash-free sessions.',
        ],
      ),
    ];
  }
}
