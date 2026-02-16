import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/skill_mastery.dart';
import '../../data/repositories/adaptive_learning_repository_impl.dart';

// Repository Provider
final adaptiveLearningRepositoryProvider = Provider((ref) => AdaptiveLearningRepositoryImpl());

// State
class AdaptiveLearningState {
  final List<SkillMastery> masteryList;
  final List<String> suggestions;
  final bool isLoading;
  final String? error;

  AdaptiveLearningState({
    this.masteryList = const [],
    this.suggestions = const [],
    this.isLoading = false,
    this.error,
  });

  AdaptiveLearningState copyWith({
    List<SkillMastery>? masteryList,
    List<String>? suggestions,
    bool? isLoading,
    String? error,
  }) {
    return AdaptiveLearningState(
      masteryList: masteryList ?? this.masteryList,
      suggestions: suggestions ?? this.suggestions,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Notifier
class AdaptiveLearningNotifier extends StateNotifier<AdaptiveLearningState> {
  final AdaptiveLearningRepositoryImpl repository;

  AdaptiveLearningNotifier({required this.repository}) : super(AdaptiveLearningState());

  Future<void> loadMasteryData() async {
    state = state.copyWith(isLoading: true, error: null);

    final masteryResult = await repository.getStudentMastery();
    final suggestionsResult = await repository.suggestNextTopics();

    masteryResult.fold(
      (failure) => state = state.copyWith(isLoading: false, error: failure.message),
      (mastery) {
        suggestionsResult.fold(
          (failure) => state = state.copyWith(isLoading: false, error: failure.message),
          (suggestions) {
            state = state.copyWith(
              isLoading: false,
              masteryList: mastery,
              suggestions: suggestions,
              error: null,
            );
          },
        );
      },
    );
  }
}

// Provider
final adaptiveLearningProvider =
    StateNotifierProvider<AdaptiveLearningNotifier, AdaptiveLearningState>((ref) {
  return AdaptiveLearningNotifier(
    repository: ref.read(adaptiveLearningRepositoryProvider),
  );
});
