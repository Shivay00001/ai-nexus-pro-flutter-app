import 'package:equatable/equatable.dart';

class OfflineAiModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final double sizeInMB;
  final bool isDownloaded;
  final double downloadProgress;
  final String? localPath;

  const OfflineAiModel({
    required this.id,
    required this.name,
    required this.description,
    required this.sizeInMB,
    this.isDownloaded = false,
    this.downloadProgress = 0.0,
    this.localPath,
  });

  @override
  List<Object?> get props => [id, name, description, sizeInMB, isDownloaded, downloadProgress, localPath];
}
