import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/usecases/get_dashboard_data_usecase.dart';
import '../../data/repositories/dashboard_repository_impl.dart';

// Repository Provider
final dashboardRepositoryProvider = Provider((ref) => DashboardRepositoryImpl());

// Use Case Provider
final getDashboardDataUseCaseProvider = Provider((ref) {
  return GetDashboardDataUseCase(ref.read(dashboardRepositoryProvider));
});

// Dashboard State
class DashboardState {
  final DashboardData? data;
  final bool isLoading;
  final String? error;

  DashboardState({
    this.data,
    this.isLoading = false,
    this.error,
  });

  DashboardState copyWith({
    DashboardData? data,
    bool? isLoading,
    String? error,
  }) {
    return DashboardState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

// Dashboard Notifier
class DashboardNotifier extends StateNotifier<DashboardState> {
  final GetDashboardDataUseCase getDashboardDataUseCase;

  DashboardNotifier({required this.getDashboardDataUseCase})
      : super(DashboardState());

  Future<void> loadDashboardData() async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await getDashboardDataUseCase();

    result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          error: failure.message,
        );
      },
      (data) {
        state = state.copyWith(
          isLoading: false,
          data: data,
          error: null,
        );
      },
    );
  }
}

// Dashboard Provider
final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>((ref) {
  return DashboardNotifier(
    getDashboardDataUseCase: ref.read(getDashboardDataUseCaseProvider),
  );
});
