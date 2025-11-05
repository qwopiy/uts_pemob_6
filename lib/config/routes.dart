import 'package:go_router/go_router.dart';
import 'package:uts_pemob_6/screens/home_screen.dart';
import 'package:uts_pemob_6/screens/quiz_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String quiz = '/quiz';
  static const String stats = '/stats';
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
    )
  ]
);