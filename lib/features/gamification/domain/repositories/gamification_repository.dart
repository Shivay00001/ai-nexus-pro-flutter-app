import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/achievement.dart';

abstract class GamificationRepository {
  Future<Either<Failure, List<Achievement>>> getAchievements();
  Future<Either<Failure, List<Badge>>> getBadges();
  Future<Either<Failure, void>> unlockAchievement(String achievementId);
}
