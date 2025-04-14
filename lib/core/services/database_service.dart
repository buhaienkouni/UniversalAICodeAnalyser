import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../model/project_analyzer_models.dart';
import '../model/project_evaluator_models.dart';
import '../model/project_session_model.dart';

class DatabaseService {
  static const String _appFolderName = 'universal_ai_code_analyser';
  static const String _dbFileName = 'projects_database.json';

  // Get the application directory path
  Future<Directory> get _appDirectory async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final Directory appDir = Directory(
      path.join(appDocDir.path, _appFolderName),
    );

    // Create the directory if it doesn't exist
    if (!await appDir.exists()) {
      await appDir.create(recursive: true);
    }

    return appDir;
  }

  // Get the database file
  Future<File> get _dbFile async {
    final appDir = await _appDirectory;
    return File(path.join(appDir.path, _dbFileName));
  }

  // Check if the database exists
  Future<bool> databaseExists() async {
    final file = await _dbFile;
    return await file.exists();
  }

  // Initialize database if it doesn't exist
  Future<void> initializeDatabase() async {
    final file = await _dbFile;
    if (!await file.exists()) {
      await file.writeAsString(jsonEncode({}));
      log('Database initialized at: ${file.path}');
    }
  }

  // Get all projects data
  Future<Map<String, List<ProjectSession>>> getAllProjects() async {
    try {
      await initializeDatabase();
      final file = await _dbFile;
      final String contents = await file.readAsString();
      final Map<String, dynamic> jsonData = jsonDecode(contents);

      final Map<String, List<ProjectSession>> result = {};

      jsonData.forEach((projectPath, sessions) {
        result[projectPath] =
            (sessions as List)
                .map((session) => ProjectSession.fromJson(session))
                .toList();
      });

      return result;
    } catch (e) {
      log('Error reading database: $e');
      return {};
    }
  }

  // Get sessions for a specific project
  Future<List<ProjectSession>> getProjectSessionsForProject(
    String projectPath,
  ) async {
    try {
      final allProjects = await getAllProjects();
      return allProjects[_normalizeProjectPath(projectPath)] ?? [];
    } catch (e) {
      log('Error getting project sessions: $e');
      return [];
    }
  }

  // Save a new project session
  Future<void> saveProjectSession({
    required String selectedDirectory,
    required ProjectAnalysisResponse projectAnalysisResponse,
    String? userRemarks,
    required ProjectEvaluationResponse projectEvaluationResponse,
  }) async {
    try {
      await initializeDatabase();

      final String timestamp = DateTime.now().toIso8601String();
      final String normalizedPath = _normalizeProjectPath(selectedDirectory);

      final ProjectSession newSession = ProjectSession(
        timestamp: timestamp,
        selectedDirectory: selectedDirectory,
        projectAnalysisResponse: projectAnalysisResponse,
        userRemarks: userRemarks,
        projectEvaluationResponse: projectEvaluationResponse,
      );

      final allProjects = await getAllProjects();

      if (!allProjects.containsKey(normalizedPath)) {
        allProjects[normalizedPath] = [];
      }

      allProjects[normalizedPath]!.add(newSession);

      final file = await _dbFile;
      final Map<String, dynamic> jsonData = {};

      allProjects.forEach((key, value) {
        jsonData[key] = value.map((session) => session.toJson()).toList();
      });

      await file.writeAsString(jsonEncode(jsonData));
      log('Session saved successfully for project: $normalizedPath');
    } catch (e) {
      log('Error saving project session: $e');
      throw Exception('Failed to save project session: $e');
    }
  }

  // Helper to normalize project path for use as a key
  String _normalizeProjectPath(String projectPath) {
    // Replace characters that might be problematic in paths or JSON keys
    return projectPath.replaceAll(RegExp(r'[:<>"|?*]'), '_');
  }

  // Delete a project session
  Future<void> deleteProjectSession({
    required String selectedDirectory,
    required String timestamp,
  }) async {
    try {
      final String normalizedPath = _normalizeProjectPath(selectedDirectory);
      final allProjects = await getAllProjects();

      if (!allProjects.containsKey(normalizedPath)) {
        return; // Project not found, nothing to delete
      }

      final sessions = allProjects[normalizedPath]!;
      allProjects[normalizedPath] =
          sessions.where((s) => s.timestamp != timestamp).toList();

      // If no sessions left for the project, remove the project entry
      if (allProjects[normalizedPath]!.isEmpty) {
        allProjects.remove(normalizedPath);
      }

      // Save back to the file
      final file = await _dbFile;
      final Map<String, dynamic> jsonData = {};

      allProjects.forEach((key, value) {
        jsonData[key] = value.map((session) => session.toJson()).toList();
      });

      await file.writeAsString(jsonEncode(jsonData));
      log('Session deleted successfully: $timestamp');
    } catch (e) {
      log('Error deleting project session: $e');
      throw Exception('Failed to delete project session: $e');
    }
  }

  // Delete all sessions for a project
  Future<void> deleteProject(String projectPath) async {
    try {
      final String normalizedPath = _normalizeProjectPath(projectPath);
      final allProjects = await getAllProjects();

      if (!allProjects.containsKey(normalizedPath)) {
        return; // Project not found, nothing to delete
      }

      allProjects.remove(normalizedPath);

      // Save back to the file
      final file = await _dbFile;
      final Map<String, dynamic> jsonData = {};

      allProjects.forEach((key, value) {
        jsonData[key] = value.map((session) => session.toJson()).toList();
      });

      await file.writeAsString(jsonEncode(jsonData));
      log('Project deleted successfully: $normalizedPath');
    } catch (e) {
      log('Error deleting project: $e');
      throw Exception('Failed to delete project: $e');
    }
  }
}
