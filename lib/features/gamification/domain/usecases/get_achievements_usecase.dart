import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/achievement.dart';
import '../repositories/gamification_repository.dart';

class GetAchievementsUseCase {
  final GamificationRepository repository;

  GetAchievementsUseCase(this.repository);

  Future<Either<Failure, List<Achievement>>> call() async {
    return await repository.getAchievements();
  }
}
