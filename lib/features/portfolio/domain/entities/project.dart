import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? externalLink;
  final String? githubLink;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    this.externalLink,
    this.githubLink,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
        techStack,
        externalLink,
        githubLink,
      ];
}
