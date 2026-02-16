import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/skill_mastery.dart';

part 'skill_mastery_model.freezed.dart';
part 'skill_mastery_model.g.dart';

@freezed
class SkillMasteryModel with _$SkillMasteryModel {
  const factory SkillMasteryModel({
    required String skillId,
    required String skillName,
    required double masteryScore,
    required MasteryLevel level,
    required List<String> strengthAreas,
    required List<String> weakAreas,
  }) = _SkillMasteryModel;

  factory SkillMasteryModel.fromJson(Map<String, dynamic> json) =>
      _$SkillMasteryModelFromJson(json);
}

extension SkillMasteryModelX on SkillMasteryModel {
  SkillMastery toEntity() => SkillMastery(
        skillId: skillId,
        skillName: skillName,
        masteryScore: masteryScore,
        level: level,
        strengthAreas: strengthAreas,
        weakAreas: weakAreas,
      );
}
