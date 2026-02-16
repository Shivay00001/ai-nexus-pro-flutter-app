import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/ai_tutor_repository.dart';
import 'package:uuid/uuid.dart';

class AiTutorRepositoryImpl implements AiTutorRepository {
  final _uuid = const Uuid();

  @override
  Stream<Either<Failure, ChatMessage>> sendMessage(String text) async* {
    // 1. Return User Message immediately (though typically done in UI/Provider)
    
    // 2. Simulate AI response streaming
    final aiMessageId = _uuid.v4();
    String currentText = "";
    
    final responsePayload = "I can certainly help you with that! Based on your current progress in Quantum Physics, it seems you're ready to dive into Wave-Particle Duality. Shall we start with the double-slit experiment?";
    final words = responsePayload.split(" ");

    for (var i = 0; i < words.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      currentText += (i == 0 ? "" : " ") + words[i];
      
      yield Right(ChatMessage(
        id: aiMessageId,
        text: currentText,
        role: MessageRole.assistant,
        timestamp: DateTime.now(),
        isStreaming: i < words.length - 1,
      ));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessage>>> getChatHistory() async {
    return const Right([]);
  }

  @override
  Future<Either<Failure, void>> clearHistory() async {
    return const Right(null);
  }
}
