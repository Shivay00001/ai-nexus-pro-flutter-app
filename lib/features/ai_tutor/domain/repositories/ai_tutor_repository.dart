import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/chat_message.dart';

abstract class AiTutorRepository {
  Stream<Either<Failure, ChatMessage>> sendMessage(String text);
  Future<Either<Failure, List<ChatMessage>>> getChatHistory();
  Future<Either<Failure, void>> clearHistory();
}
