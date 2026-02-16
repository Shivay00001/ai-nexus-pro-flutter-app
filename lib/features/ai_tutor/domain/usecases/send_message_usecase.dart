import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/chat_message.dart';
import '../repositories/ai_tutor_repository.dart';

class SendMessageUseCase {
  final AiTutorRepository repository;

  SendMessageUseCase(this.repository);

  Stream<Either<Failure, ChatMessage>> call(String text) {
    return repository.sendMessage(text);
  }
}
