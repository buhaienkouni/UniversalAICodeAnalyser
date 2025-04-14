abstract class ProjectEvent {}

// AI-Analysis-related events

class ChooseProjectDirectoryEvent extends ProjectEvent {
  final String projectPath;

  ChooseProjectDirectoryEvent(this.projectPath);
}

class AddUserRemarksEvent extends ProjectEvent {
  final String remarks;

  AddUserRemarksEvent(this.remarks);
}

class AnalyzeProjectEvent extends ProjectEvent {}

class EvaluateProjectEvent extends ProjectEvent {}

// Database-related events

class SaveProjectSessionEvent extends ProjectEvent {}

class LoadProjectSessionEvent extends ProjectEvent {
  final String projectPath;
  final String timestamp;

  LoadProjectSessionEvent({required this.projectPath, required this.timestamp});
}

class LoadAllProjectsEvent extends ProjectEvent {}

class DeleteProjectSessionEvent extends ProjectEvent {
  final String projectPath;
  final String timestamp;

  DeleteProjectSessionEvent({
    required this.projectPath,
    required this.timestamp,
  });
}

class DeleteProjectEvent extends ProjectEvent {
  final String projectPath;

  DeleteProjectEvent(this.projectPath);
}
