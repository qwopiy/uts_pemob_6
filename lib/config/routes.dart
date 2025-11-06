import 'package:go_router/go_router.dart';
import 'package:uts_pemob_6/screens/answer_screen.dart';
import 'package:uts_pemob_6/screens/home_screen.dart';
import 'package:uts_pemob_6/screens/quiz_screen.dart';

import '../screens/result_screen.dart';
import '../screens/settings_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String quiz = '/quiz';
  static const String answer = '/answer';
  static const String stats = '/stats';
  static const String result = '/result';
  static const String settings = '/settings';
}

GoRouter router = GoRouter(
  routes: <RouteBase>[
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
       path: AppRoutes.result,
       builder: (context, state) => const ResultScreen(),
     ),

    GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => const SettingsScreen(),
    )
  ]
);