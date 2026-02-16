class ApiConstants {
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.edtech.com/v1',
  );

  // Auth Endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String verifyEmail = '/auth/verify-email';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';

  // User Endpoints
  static const String userProfile = '/users/profile';
  static const String updateProfile = '/users/profile/update';
  static const String changePassword = '/users/change-password';

  // Learning Path Endpoints
  static const String learningPaths = '/learning-paths';
  static const String personalizedPath = '/learning-paths/personalized';
  static const String pathProgress = '/learning-paths/progress';
  static const String lessons = '/lessons';

  // AI Tutor Endpoints
  static const String aiChat = '/ai/chat';
  static const String aiAnalysis = '/ai/analyze';
  static const String aiRecommendations = '/ai/recommendations';

  // Exam Endpoints
  static const String exams = '/exams';
  static const String examSubmit = '/exams/submit';
  static const String examResults = '/exams/results';
  static const String predictiveAnalysis = '/exams/predict';

  // Gamification Endpoints
  static const String achievements = '/gamification/achievements';
  static const String leaderboard = '/gamification/leaderboard';
  static const String rewards = '/gamification/rewards';
  static const String badges = '/gamification/badges';

  // Analytics Endpoints
  static const String analytics = '/analytics';
  static const String progressReport = '/analytics/progress';
  static const String performanceMetrics = '/analytics/performance';

  // Communication Endpoints
  static const String wsBaseUrl = String.fromEnvironment(
    'WS_BASE_URL',
    defaultValue: 'wss://ws.edtech.com',
  );
  static const String chatMessages = '/chat/messages';
  static const String notifications = '/notifications';

  // Parent Dashboard Endpoints
  static const String parentDashboard = '/parent/dashboard';
  static const String childProgress = '/parent/child-progress';
  static const String parentNotifications = '/parent/notifications';

  // Admin Endpoints
  static const String adminDashboard = '/admin/dashboard';
  static const String userManagement = '/admin/users';
  static const String contentManagement = '/admin/content';
  static const String platformAnalytics = '/admin/analytics';

  // Career Forecast Endpoints
  static const String careerPaths = '/career/paths';
  static const String skillDemand = '/career/skill-demand';
  static const String careerRecommendations = '/career/recommendations';

  // Voice Validation Endpoints
  static const String voiceValidation = '/voice/validate';
  static const String speechToText = '/voice/stt';
  static const String textToSpeech = '/voice/tts';

  // Spaced Repetition Endpoints
  static const String flashcards = '/spaced-repetition/flashcards';
  static const String reviewSchedule = '/spaced-repetition/schedule';
}

class AppConstants {
  static const String appName = 'AI EdTech Platform';
  static const String appVersion = '1.0.0';
  
  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;
  
  // Timeouts
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  
  // Cache
  static const Duration cacheExpiration = Duration(hours: 24);
  
  // User Roles
  static const String roleStudent = 'student';
  static const String roleTeacher = 'teacher';
  static const String roleParent = 'parent';
  static const String roleAdmin = 'admin';
  
  // Local Storage Keys
  static const String tokenKey = 'auth_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userKey = 'user_data';
  static const String themeModeKey = 'theme_mode';
  static const String languageKey = 'language';
}

class StorageConstants {
  static const String authBox = 'auth_box';
  static const String userBox = 'user_box';
  static const String cacheBox = 'cache_box';
  static const String settingsBox = 'settings_box';
}
