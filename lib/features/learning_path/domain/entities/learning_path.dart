import 'package:equatable/equatable.dart';

class LearningPath extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<Lesson> lessons;
  final double progress;

  const LearningPath({
    required this.id,
    required this.title,
    required this.description,
    required this.lessons,
    this.progress = 0.0,
  });

  @override
  List<Object?> get props => [id, title, description, lessons, progress];
}

class Lesson extends Equatable {
  final String id;
  final String title;
  final String content;
  final LessonType type;
  final bool isCompleted;
  final List<String>? quizQuestionIds;

  const Lesson({
    required this.id,
    required this.title,
    required this.content,
    required this.type,
    this.isCompleted = false,
    this.quizQuestionIds,
  });

  @override
  List<Object?> get props => [id, title, content, type, isCompleted, quizQuestionIds];
}

enum LessonType { video, text, interactive, exam }
