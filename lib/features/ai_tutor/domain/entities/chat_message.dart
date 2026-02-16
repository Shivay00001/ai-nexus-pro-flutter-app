import 'package:equatable/equatable.dart';

enum MessageRole { user, assistant, system }

class ChatMessage extends Equatable {
  final String id;
  final String text;
  final MessageRole role;
  final DateTime timestamp;
  final List<MessageAttachment>? attachments;
  final bool isStreaming;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.role,
    required this.timestamp,
    this.attachments,
    this.isStreaming = false,
  });

  @override
  List<Object?> get props => [id, text, role, timestamp, attachments, isStreaming];
}

class MessageAttachment extends Equatable {
  final String id;
  final String type; // 'image', 'video', '3d_model', 'doc'
  final String url;
  final String? thumbnail;

  const MessageAttachment({
    required this.id,
    required this.type,
    required this.url,
    this.thumbnail,
  });

  @override
  List<Object?> get props => [id, type, url, thumbnail];
}
