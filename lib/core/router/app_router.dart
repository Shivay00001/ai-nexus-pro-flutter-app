import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_screen.dart';
import '../../features/ai_tutor/presentation/screens/ai_chat_screen.dart';
import '../../features/learning_path/presentation/screens/learning_path_screen.dart';
import '../../features/gamification/presentation/screens/achievements_screen.dart';
import '../../features/voice_validation/presentation/screens/voice_validation_screen.dart';
import '../../features/adaptive_learning/presentation/screens/mastery_screen.dart';
import '../../features/offline_ai/presentation/screens/offline_ai_screen.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';

// Splash Screen (Placeholder)
import 'package:flutter/material.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) => const Scaffold(body: Center(child: CircularProgressIndicator()));
}

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isAuthenticated = authState.isAuthenticated;
      final isLoggingIn = state.matchedLocation == '/login';

      if (!isAuthenticated && !isLoggingIn) return '/login';
      if (isAuthenticated && isLoggingIn) return '/dashboard';

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/ai-chat',
        builder: (context, state) => const AiChatScreen(),
      ),
      GoRoute(
        path: '/learning-path',
        builder: (context, state) => const LearningPathScreen(),
      ),
      GoRoute(
        path: '/achievements',
        builder: (context, state) => const AchievementsScreen(),
      ),
      GoRoute(
        path: '/voice-validation',
        builder: (context, state) => const VoiceValidationScreen(),
      ),
      GoRoute(
        path: '/mastery',
        builder: (context, state) => const MasteryScreen(),
      ),
      GoRoute(
        path: '/offline-ai',
        builder: (context, state) => const OfflineAiScreen(),
      ),
    ],
  );
});
