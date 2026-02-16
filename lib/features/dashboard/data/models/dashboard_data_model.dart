import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dashboard_data.dart';

part 'dashboard_data_model.freezed.dart';
part 'dashboard_data_model.g.dart';

@freezed
class DashboardDataModel with _$DashboardDataModel {
  const factory DashboardDataModel({
    required int completedCourses,
    required int totalLessons,
    required double learningProgress,
    required int totalXP,
    required int currentStreak,
    required String currentRank,
    required List<RecentActivityModel> recentActivities,
  }) = _DashboardDataModel;

  factory DashboardDataModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataModelFromJson(json);
}

@freezed
class RecentActivityModel with _$RecentActivityModel {
  const factory RecentActivityModel({
    required String id,
    required String title,
    required String type,
    required DateTime timestamp,
  }) = _RecentActivityModel;

  factory RecentActivityModel.fromJson(Map<String, dynamic> json) =>
      _$RecentActivityModelFromJson(json);
}

extension DashboardDataModelX on DashboardDataModel {
  DashboardData toEntity() => DashboardData(
        completedCourses: completedCourses,
        totalLessons: totalLessons,
        learningProgress: learningProgress,
        totalXP: totalXP,
        currentStreak: currentStreak,
        currentRank: currentRank,
        recentActivities: recentActivities.map((e) => e.toEntity()).toList(),
      );
}

extension RecentActivityModelX on RecentActivityModel {
  RecentActivity toEntity() => RecentActivity(
        id: id,
        title: title,
        type: type,
        timestamp: timestamp,
      );
}
