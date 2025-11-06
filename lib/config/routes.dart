import 'package:go_router/go_router.dart';
import 'package:uts_pemob_6/screens/answer_screen.dart';
import 'package:uts_pemob_6/screens/home_screen.dart';
import 'package:uts_pemob_6/screens/quiz_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String quiz = '/quiz';
  static const String answer = '/answer';
  static const String stats = '/stats';
  static const String settings = '/settings';
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    
    GoRoute(
      path: AppRoutes.quiz,
      builder: (context, state) => QuizScreen(),
    ),

    GoRoute(
      path: AppRoutes.answer,
      builder: (context, state) => const AnswerScreen(),
    ),

    GoRoute(
      path: AppRoutes.stats,
      builder: (context, state) => const StatsScreen(),
    ),

    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    )
  ]
);