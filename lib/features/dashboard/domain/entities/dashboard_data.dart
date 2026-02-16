import 'package:equatable/equatable.dart';

class DashboardData extends Equatable {
  final int completedCourses;
  final int totalLessons;
  final double learningProgress;
  final int totalXP;
  final int currentStreak;
  final String currentRank;
  final List<RecentActivity> recentActivities;

  const DashboardData({
    required this.completedCourses,
    required this.totalLessons,
    required this.learningProgress,
    required this.totalXP,
    required this.currentStreak,
    required this.currentRank,
    required this.recentActivities,
  });

  @override
  List<Object?> get props => [
        completedCourses,
        totalLessons,
        learningProgress,
        totalXP,
        currentStreak,
        currentRank,
        recentActivities,
      ];
}

class RecentActivity extends Equatable {
  final String id;
  final String title;
  final String type; // 'lesson', 'exam', 'achievement'
  final DateTime timestamp;

  const RecentActivity({
    required this.id,
    required this.title,
    required this.type,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [id, title, type, timestamp];
}
