import 'package:equatable/equatable.dart';

class Achievement extends Equatable {
  final String id;
  final String title;
  final String description;
  final String iconUrl;
  final bool isUnlocked;
  final DateTime? unlockedAt;

  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.iconUrl,
    this.isUnlocked = false,
    this.unlockedAt,
  });

  @override
  List<Object?> get props => [id, title, description, iconUrl, isUnlocked, unlockedAt];
}

class Badge extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String criteria;

  const Badge({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.criteria,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, criteria];
}
