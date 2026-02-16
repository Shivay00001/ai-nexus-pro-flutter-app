import 'package:equatable/equatable.dart';

class VoiceValidationResult extends Equatable {
  final bool isCorrect;
  final double confidenceScore;
  final String transcription;
  final String feedback;
  final List<String>? suggestions;

  const VoiceValidationResult({
    required this.isCorrect,
    required this.confidenceScore,
    required this.transcription,
    required this.feedback,
    this.suggestions,
  });

  @override
  List<Object?> get props => [isCorrect, confidenceScore, transcription, feedback, suggestions];
}
