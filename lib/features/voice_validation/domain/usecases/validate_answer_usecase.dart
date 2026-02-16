import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/voice_validation_result.dart';
import '../repositories/voice_validation_repository.dart';

class ValidateAnswerUseCase {
  final VoiceValidationRepository repository;

  ValidateAnswerUseCase(this.repository);

  Future<Either<Failure, VoiceValidationResult>> call({
    required String questionId,
    required String expectedAnswer,
    required String audioPath,
  }) async {
    return await repository.validateAnswer(
      questionId: questionId,
      expectedAnswer: expectedAnswer,
      audioPath: audioPath,
    );
  }
}
