import 'package:equatable/equatable.dart';

class Skill extends Equatable {
  final String id;
  final String title;
  final String description;
  final String imageUrl; // For 3D generated visuals

  const Skill({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, description, imageUrl];
}
