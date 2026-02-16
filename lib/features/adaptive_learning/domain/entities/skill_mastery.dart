import 'package:equatable/equatable.dart';

class SkillMastery extends Equatable {
  final String skillId;
  final String skillName;
  final double masteryScore; // 0.0 to 1.0
  final MasteryLevel level;
  final List<String> strengthAreas;
  final List<String> weakAreas;

  const SkillMastery({
    required this.skillId,
    required this.skillName,
    required this.masteryScore,
    required this.level,
    required this.strengthAreas,
    required this.weakAreas,
  });

  @override
  List<Object?> get props => [skillId, skillName, masteryScore, level, strengthAreas, weakAreas];
}

enum MasteryLevel { novice, intermediate, advanced, expert, master }
