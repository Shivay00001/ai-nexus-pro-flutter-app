import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/offline_ai_model.dart';

abstract class OfflineAiRepository {
  Future<Either<Failure, List<OfflineAiModel>>> getAvailableModels();
  Future<Either<Failure, void>> downloadModel(String modelId);
  Future<Either<Failure, String>> runInference(String prompt, String modelId);
  Future<Either<Failure, void>> deleteModel(String modelId);
}
