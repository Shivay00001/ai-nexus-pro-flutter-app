import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/skill_mastery.dart';
import '../../domain/repositories/adaptive_learning_repository.dart';
import '../models/skill_mastery_model.dart';

class AdaptiveLearningRepositoryImpl implements AdaptiveLearningRepository {
  final ApiClient _apiClient;

  AdaptiveLearningRepositoryImpl(this._apiClient);

  @override
  Future<Either<Failure, List<SkillMastery>>> getStudentMastery() async {
    try {
      final response = await _apiClient.get(ApiConstants.performanceMetrics);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final List<SkillMastery> mastery = data
            .map((e) => SkillMasteryModel.fromJson(e).toEntity())
            .toList();
        return Right(mastery);
      } else {
        return const Left(ServerFailure('Failed to fetch student mastery'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateMastery(String skillId, double scoreDelta) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, List<String>>> suggestNextTopics() async {
    try {
      return const Right(['Quantum Entanglement', 'Bell\'s Theorem', 'Quantum Computing Basics']);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
