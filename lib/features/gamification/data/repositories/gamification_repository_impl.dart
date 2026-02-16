import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/repositories/gamification_repository.dart';

class GamificationRepositoryImpl implements GamificationRepository {
  @override
  Future<Either<Failure, List<Achievement>>> getAchievements() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right([
        Achievement(
          id: '1',
          title: 'First Step',
          description: 'Complete your first lesson.',
          iconUrl: 'assets/icons/first_step.png',
          isUnlocked: true,
        ),
        Achievement(
          id: '2',
          title: 'Quiz Master',
          description: 'Get 100% in a quiz.',
          iconUrl: 'assets/icons/quiz_master.png',
          isUnlocked: true,
        ),
        Achievement(
          id: '3',
          title: 'Streak King',
          description: 'Maintain a 7-day streak.',
          iconUrl: 'assets/icons/streak_king.png',
          isUnlocked: false,
        ),
        Achievement(
          id: '4',
          title: 'Quantum Explorer',
          description: 'Complete the Quantum Physics path.',
          iconUrl: 'assets/icons/quantum_explorer.png',
          isUnlocked: false,
        ),
      ]);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Badge>>> getBadges() async {
    try {
      return const Right([
        Badge(
          id: 'b1',
          name: 'Early Bird',
          imageUrl: 'assets/icons/early_bird.png',
          criteria: 'Study before 8 AM for 3 days.',
        ),
        Badge(
          id: 'b2',
          name: 'Night Owl',
          imageUrl: 'assets/icons/night_owl.png',
          criteria: 'Study after 10 PM for 3 days.',
        ),
      ]);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> unlockAchievement(String achievementId) async {
    return const Right(null);
  }
}
