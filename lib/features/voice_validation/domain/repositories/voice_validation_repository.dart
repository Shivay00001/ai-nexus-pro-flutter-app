import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/voice_validation_result.dart';

abstract class VoiceValidationRepository {
  Future<Either<Failure, VoiceValidationResult>> validateAnswer({
    required String questionId,
    required String expectedAnswer,
    required String audioPath,
  });

  Future<Either<Failure, String>> startListening();
  Future<void> stopListening();
}
