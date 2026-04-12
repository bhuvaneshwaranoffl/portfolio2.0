import 'package:equatable/equatable.dart';

class Experience extends Equatable {
  final String id;
  final String role;
  final String company;
  final String period;
  final String description;
  final List<String> achievements;

  const Experience({
    required this.id,
    required this.role,
    required this.company,
    required this.period,
    required this.description,
    required this.achievements,
  });

  @override
  List<Object?> get props => [id, role, company, period, description, achievements];
}
