import 'package:get_it/get_it.dart';

import '../api/project_api_client.dart';
import '../../features/bloc/project_bloc.dart';
import '../services/database_service.dart';
import '../services/project_evaluation_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  // Register API client
  getIt.registerLazySingleton<ProjectApiClient>(() => ProjectApiClient());

  // Register project evaluation service
  getIt.registerLazySingleton<ProjectEvaluationService>(
    () => ProjectEvaluationService(getIt<ProjectApiClient>()),
  );

  // Register database service
  getIt.registerLazySingleton<DatabaseService>(() => DatabaseService());

  // Register BLoC as a singleton (shared instance)
  getIt.registerLazySingleton<ProjectBloc>(
    () => ProjectBloc(
      getIt<ProjectEvaluationService>(),
      getIt<DatabaseService>(),
    ),
  );
}
