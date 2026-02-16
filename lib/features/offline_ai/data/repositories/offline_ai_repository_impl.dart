import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/offline_ai_model.dart';
import '../../domain/repositories/offline_ai_repository.dart';

class OfflineAiRepositoryImpl implements OfflineAiRepository {
  @override
  Future<Either<Failure, List<OfflineAiModel>>> getAvailableModels() async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      return const Right([
        OfflineAiModel(
          id: 'm1',
          name: 'Llama-3-8B (Quantized)',
          description: 'Optimized for mobile text inference and tutor assistance.',
          sizeInMB: 2048,
          isDownloaded: true,
          downloadProgress: 1.0,
        ),
        OfflineAiModel(
          id: 'm2',
          name: 'MobileNet-V3',
          description: 'On-device vision model for image-based problem solving.',
          sizeInMB: 15.4,
          isDownloaded: false,
          downloadProgress: 0.0,
        ),
        OfflineAiModel(
          id: 'm3',
          name: 'Whisper-Tiny',
          description: 'Local speech-to-text model for offline voice validation.',
          sizeInMB: 75,
          isDownloaded: false,
          downloadProgress: 0.0,
        ),
      ]);
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
