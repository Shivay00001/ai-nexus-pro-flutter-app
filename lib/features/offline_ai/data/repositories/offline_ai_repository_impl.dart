import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/offline_ai_model.dart';
import '../../domain/repositories/offline_ai_repository.dart';
import '../models/offline_ai_model_model.dart';

class OfflineAiRepositoryImpl implements OfflineAiRepository {
  final ApiClient _apiClient;

  OfflineAiRepositoryImpl(this._apiClient);

  @override
  Future<Either<Failure, List<OfflineAiModel>>> getAvailableModels() async {
    try {
      // Fetch available models from a central registry or metadata endpoint
      final response = await _apiClient.get('/ai/models/available'); 

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return Right(data.map((e) => OfflineAiModelModel.fromJson(e).toEntity()).toList());
      } else {
        return const Left(ServerFailure('Failed to fetch available AI models'));
      }
    } catch (e) {
       return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> downloadModel(String modelId) async {
    return const Right(null);
  }

  @override
  Future<Either<Failure, String>> runInference(String prompt, String modelId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 1500));
      return const Right("This is a mock offline AI response generated on-device.");
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteModel(String modelId) async {
    return const Right(null);
  }
}
