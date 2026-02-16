import 'dart:async';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/constants/api_constants.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/ai_tutor_repository.dart';
import '../models/chat_message_model.dart';
import 'package:uuid/uuid.dart';

class AiTutorRepositoryImpl implements AiTutorRepository {
  final ApiClient _apiClient;
  final _uuid = const Uuid();

  AiTutorRepositoryImpl(this._apiClient);

  @override
  Stream<Either<Failure, ChatMessage>> sendMessage(String text) async* {
    try {
      // In a real scenario, this would use a Server-Sent Events (SSE) or WebSocket.
      // Here we simulate the streaming behavior while Calling a real endpoint.
      final response = await _apiClient.post(
        ApiConstants.aiChat,
        data: {'message': text},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final fullMessage = ChatMessageModel.fromJson(response.data).toEntity();
        
        // Simulating the streaming of the fetched message for UI consistency
        final words = fullMessage.text.split(" ");
        String currentText = "";
        
        for (var i = 0; i < words.length; i++) {
          await Future.delayed(const Duration(milliseconds: 50));
          currentText += (i == 0 ? "" : " ") + words[i];
          
          yield Right(fullMessage.copyWith(
            text: currentText,
            isStreaming: i < words.length - 1,
          ));
        }
      } else {
        yield const Left(ServerFailure('Failed to get AI response'));
      }
    } catch (e) {
      yield Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ChatMessage>>> getChatHistory() async {
    try {
      final response = await _apiClient.get(ApiConstants.chatMessages);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return Right(data.map((e) => ChatMessageModel.fromJson(e).toEntity()).toList());
      }
      return const Right([]);
    } catch (_) {
      return const Right([]);
    }
  }

  @override
  Future<Either<Failure, void>> clearHistory() async {
    return const Right(null);
  }
}
