import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/learning_path.dart';
import '../../domain/repositories/learning_path_repository.dart';

class LearningPathRepositoryImpl implements LearningPathRepository {
  @override
  Future<Either<Failure, LearningPath>> getPersonalizedPath() async {
    try {
      // Mock data
      await Future.delayed(const Duration(milliseconds: 600));
      return Right(LearningPath(
        id: 'qp-1',
        title: 'Quantum Physics Mastery',
        description: 'From wave functions to quantum entanglement.',
        progress: 0.3,
        lessons: [
          const Lesson(
            id: 'l1',
            title: 'Introduction to Wave Functions',
            content: 'Exploring the probabilistic nature of subatomic particles.',
            type: LessonType.video,
            isCompleted: true,
          ),
          const Lesson(
            id: 'l2',
            title: 'Schrödinger’s Cat Paradox',
            content: 'Understanding superposition through a famous thought experiment.',
            type: LessonType.interactive,
            isCompleted: true,
          ),
          const Lesson(
            id: 'l3',
            title: 'The Uncertainty Principle',
            content: 'Heisenberg’s fundamental limit on measurement.',
            type: LessonType.text,
            isCompleted: false,
          ),
          const Lesson(
            id: 'l4',
            title: 'Quantum Entanglement',
            content: '"Spooky action at a distance" explained.',
            type: LessonType.interactive,
            isCompleted: false,
          ),
          const Lesson(
            id: 'e1',
            title: 'Mid-Path Assessment',
            content: 'Test your knowledge on the basics of quantum mechanics.',
            type: LessonType.exam,
            isCompleted: false,
            quizQuestionIds: ['q1', 'q2', 'q3'],
          ),
        ],
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateLessonStatus(String lessonId, bool isCompleted) async {
    return const Right(null);
  }
}
