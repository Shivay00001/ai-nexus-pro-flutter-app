import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/usecases/send_message_usecase.dart';
import '../../data/repositories/ai_tutor_repository_impl.dart';
import '../../../features/auth/presentation/providers/auth_provider.dart';
import 'package:uuid/uuid.dart';

// Repository Provider
final aiTutorRepositoryProvider = Provider((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AiTutorRepositoryImpl(apiClient);
});

// Use Case Provider
final sendMessageUseCaseProvider = Provider((ref) {
  return SendMessageUseCase(ref.read(aiTutorRepositoryProvider));
});

// Chat State
class AiTutorState {
  final List<ChatMessage> messages;
  final bool isLoading;
  final String? error;

  AiTutorState({
    this.messages = const [],
    this.isLoading = false,
    this.error,
  });

  AiTutorState copyWith({
    List<ChatMessage>? messages,
    bool? isLoading,
    String? error,
  }) {
    return AiTutorState(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Chat Notifier
class AiTutorNotifier extends StateNotifier<AiTutorState> {
  final SendMessageUseCase sendMessageUseCase;
  final _uuid = const Uuid();

  AiTutorNotifier({required this.sendMessageUseCase}) : super(AiTutorState());

  Future<void> sendMessage(String text) async {
    final userMessage = ChatMessage(
      id: _uuid.v4(),
      text: text,
      role: MessageRole.user,
      timestamp: DateTime.now(),
    );

    state = state.copyWith(
      messages: [...state.messages, userMessage],
      isLoading: true,
      error: null,
    );

    final responseStream = sendMessageUseCase(text);

    await for (final result in responseStream) {
      result.fold(
        (failure) {
          state = state.copyWith(
            isLoading: false,
            error: failure.message,
          );
        },
        (aiMessage) {
          final existingIndex = state.messages.indexWhere((m) => m.id == aiMessage.id);
          
          if (existingIndex != -1) {
            // Update existing streaming message
            final updatedMessages = List<ChatMessage>.from(state.messages);
            updatedMessages[existingIndex] = aiMessage;
            state = state.copyWith(messages: updatedMessages, isLoading: aiMessage.isStreaming);
          } else {
            // Add new AI message
            state = state.copyWith(
              messages: [...state.messages, aiMessage],
              isLoading: aiMessage.isStreaming,
            );
          }
        },
      );
    }
  }

  void clearChat() {
    state = AiTutorState();
  }
}

// Provider
final aiTutorProvider = StateNotifierProvider<AiTutorNotifier, AiTutorState>((ref) {
  return AiTutorNotifier(
    sendMessageUseCase: ref.read(sendMessageUseCaseProvider),
  );
});
