import 'package:universal_ai_code_analyser/core/model/project_session_model.dart';

class ProjectHistoryItem {
  final String projectPath;
  final List<ProjectSession> sessions;

  ProjectHistoryItem({required this.projectPath, required this.sessions});
}
