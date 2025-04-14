import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/bloc/project_bloc.dart';
import 'core/config/service_locator.dart';
import 'core/navigation/app_router.dart';
import 'core/services/database_service.dart';
import 'core/theme/theme_config.dart';

void main() async {
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set up service locator
  setUpServiceLocator();

  // Initialize the database when the app starts
  final databaseService = getIt<DatabaseService>();
  await databaseService.initializeDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProjectBloc>(),
      child: MaterialApp(
        title: 'Project Evaluator',
        theme: AppTheme.darkTheme(),
        initialRoute: AppRouter.evaluationScreen,
        routes: AppRouter.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
