import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/skill_mastery.dart';

abstract class AdaptiveLearningRepository {
  Future<Either<Failure, List<SkillMastery>>> getStudentMastery();
  Future<Either<Failure, void>> updateMastery(String skillId, double scoreDelta);
  Future<Either<Failure, List<String>>> suggestNextTopics();
}
