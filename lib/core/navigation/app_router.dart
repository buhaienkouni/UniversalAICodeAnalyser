import 'package:flutter/material.dart';

import '../../features/evaluation/project_evaluation_screen.dart';
import '../../features/history/project_history_screen.dart';

class AppRouter {
  // Route names
  static const String evaluationScreen = '/';
  static const String historyScreen = '/history';

  // Route map
  static Map<String, WidgetBuilder> get routes => {
    evaluationScreen: (context) => const ProjectEvaluationScreen(),
    historyScreen: (context) => const ProjectHistoryScreen(),
  };

  // Navigation methods
  static void navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(evaluationScreen);
  }

  static void navigateToHistory(BuildContext context) {
    Navigator.of(context).pushNamed(historyScreen);
  }

  static void navigateBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
