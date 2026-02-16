import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/learning_path.dart';

abstract class LearningPathRepository {
  Future<Either<Failure, LearningPath>> getPersonalizedPath();
  Future<Either<Failure, void>> updateLessonStatus(String lessonId, bool isCompleted);
}
