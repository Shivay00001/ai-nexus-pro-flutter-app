import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  @override
  Future<Either<Failure, DashboardData>> getDashboardData() async {
    try {
      // Mock data for now
      await Future.delayed(const Duration(milliseconds: 800));
      return Right(DashboardData(
        completedCourses: 12,
        totalLessons: 45,
        learningProgress: 0.75,
        totalXP: 2450,
        currentStreak: 7,
        currentRank: 'Elite Learner',
        recentActivities: [
          RecentActivity(
            id: '1',
            title: 'Completed Quantum Physics Quiz',
            type: 'exam',
            timestamp: DateTime.now().subtract(const Duration(hours: 2)),
          ),
          RecentActivity(
            id: '2',
            title: 'Started Machine Learning Module',
            type: 'lesson',
            timestamp: DateTime.now().subtract(const Duration(days: 1)),
          ),
          RecentActivity(
            id: '3',
            title: 'Earned "Speed Demon" Badge',
            type: 'achievement',
            timestamp: DateTime.now().subtract(const Duration(days: 2)),
          ),
        ],
      ));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
