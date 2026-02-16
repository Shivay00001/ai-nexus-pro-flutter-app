import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/learning_path.dart';
import '../../domain/repositories/learning_path_repository.dart';
import '../models/learning_path_model.dart';

class LearningPathRepositoryImpl implements LearningPathRepository {
  final ApiClient _apiClient;

  LearningPathRepositoryImpl(this._apiClient);

  @override
  Future<Either<Failure, LearningPath>> getPersonalizedPath() async {
    try {
      final response = await _apiClient.get(ApiConstants.personalizedPath);

      if (response.statusCode == 200) {
        final model = LearningPathModel.fromJson(response.data);
        return Right(model.toEntity());
      } else {
        return const Left(ServerFailure('Failed to fetch learning path'));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateLessonStatus(String lessonId, bool isCompleted) async {
    return const Right(null);
  }
}
