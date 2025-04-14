import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart' as path;

/// Reads the content of multiple files from their paths
/// Returns a map where keys are file paths and values are file contents
/// Logs and ignores files that don't exist or can't be read
Future<Map<String, String>> readFilesFromPaths(List<String> paths) async {
  final Map<String, String> files = {};

  for (final path in paths) {
    final file = File(path);

    if (!await file.exists()) {
      log('File does not exist: $path');
      continue;
    }

    try {
      final content = await file.readAsString();
      files[path] = content;
    } catch (e) {
      log('Could not read file: $path - Error: $e');
    }
  }

  return files;
}

/// Reads and filters important files from the given project path.
/// This method uses asynchronous operations with proper awaiting to ensure sequential execution.
///
/// Returns a map where keys are file paths and values are file contents.
/// Throws an exception if the directory doesn't exist or if other errors occur.
Future<Map<String, String>> readImportantProjectFiles(
  String projectPath,
) async {
  final Map<String, String> files = {};

  try {
    // Validate directory exists
    final projectDirectory = Directory(projectPath);
    final bool exists = await projectDirectory.exists();
    if (!exists) {
      throw Exception('Directory does not exist: $projectPath');
    }

    // Get all entities using a completer to ensure all are collected
    final completer = Completer<List<FileSystemEntity>>();
    final entities = <FileSystemEntity>[];

    // Set up listener for directory listing
    final subscription = projectDirectory
        .list(recursive: true)
        .listen(
          (entity) => entities.add(entity),
          onError: (e) => completer.completeError(e),
          onDone: () => completer.complete(entities),
          cancelOnError: true,
        );

    // Wait for all entities to be collected
    final allEntities = await completer.future;
    await subscription.cancel();

    // Process files one by one
    for (final entity in allEntities) {
      // Skip non-file entries
      if (entity is! File) continue;

      final file = entity;

      // Apply path-based filtering
      if (_shouldSkipFileCosOfPath(file.path)) {
        continue;
      }

      try {
        // Get file stats and check size
        final fileStats = await file.stat();
        final fileSize = fileStats.size;
        if (_shouldSkipFileCosOfSIze(fileSize)) {
          continue;
        }

        // Read file content
        try {
          final content = await file.readAsString();
          // Only add to the map after successful read
          files[file.path] = content;
        } catch (e) {
          // Silently skip files that can't be read as strings
        }
      } catch (e) {
        // Silently skip files that can't be accessed
      }
    }

    return files;
  } catch (e) {
    throw Exception('Error reading project files: $e');
  }
}

/// Helper method to determine if a file should be skipped based on its stats
bool _shouldSkipFileCosOfSIze(int fileSize) {
  // Skip files larger than 1MB
  if (fileSize > 1 * 1024 * 1024) {
    return true;
  }
  return false;
}

/// Helper method to determine if a file should be skipped based on its path
bool _shouldSkipFileCosOfPath(String filePath) {
  // Use path package to get filename and directory components
  final fileName = path.basename(filePath);
  final directories = path.split(path.dirname(filePath));

  // 1. Keep important files
  if (importantFiles.contains(fileName)) {
    return false;
  }

  // 2. Keep files in important directories
  if (importantDirectories.any((dir) => filePath.contains(dir))) {
    return false;
  }

  // 3. Skip files in non-important directories
  if (notImportantDirectories.any((dir) => filePath.contains(dir))) {
    return true;
  }

  // 4. Skip hidden files and directories (starting with dot but not just ".")
  if (fileName.startsWith('.') && fileName != '.') {
    return true;
  }

  // 5. Skip hidden directories (starting with dot but not just ".")
  if (directories.any((dir) => dir.startsWith('.') && dir != '.')) {
    return true;
  }

  // 6. Skip files with certain extensions
  if (skipExtensions.any((ext) => fileName.toLowerCase().endsWith(ext))) {
    return true;
  }

  // Default: include the file
  return false;
}

const importantFiles = [
  'README.md',
  'README.txt',
  'CHANGELOG.md',
  'CONTRIBUTING.md',
  'LICENSE',
  'LICENSE.txt',
  'LICENSE.md',
  '.gitignore',
  '.dockerignore',
  'pubspec.yaml',
  'pubspec.lock',
  'package.json',
  'package-lock.json',
  'yarn.lock',
  'Gemfile',
  'Gemfile.lock',
  'requirements.txt',
  'setup.py',
  'Pipfile',
  'Pipfile.lock',
  'build.gradle',
  'build.gradle.kts',
  'settings.gradle',
  'gradlew',
  'pom.xml',
  '.env',
  '.env.example',
  '.env.development',
  '.env.production',
  'Dockerfile',
  'docker-compose.yml',
  'docker-compose.yaml',
  '.travis.yml',
  '.gitlab-ci.yml',
  'circle.yml',
  'Jenkinsfile',
  'Makefile',
  'CMakeLists.txt',
  'tsconfig.json',
  'jsconfig.json',
  'eslintrc.json',
  '.eslintrc.js',
  '.prettierrc',
  '.prettierrc.js',
  'babel.config.js',
  'webpack.config.js',
  'vue.config.js',
  'angular.json',
  'project.pbxproj',
  'AndroidManifest.xml',
  'Info.plist',
  'app.json',
  'app.config.js',
  'firebase.json',
  'manifest.json',
  'appsettings.json',
  'web.config',
  'application.properties',
  'application.yml',
  'application.yaml',
  'config.xml',
  'config.json',
  '.htaccess',
  'nginx.conf',
  'swagger.json',
  'swagger.yaml',
  'openapi.json',
  'openapi.yaml',
  'analysis_options.yaml',
  'poetry.lock',
  'pyproject.toml',
  'composer.json',
  'composer.lock',
  'Cargo.toml',
  'Cargo.lock',
  'go.mod',
  'go.sum',
  'nuget.config',
  'packages.config',
  'project.json',
  'settings.json',
  'lerna.json',
  'nx.json',
  'cypress.json',
  'jest.config.js',
  'karma.conf.js',
  'protractor.conf.js',
  'sonar-project.properties',
  'bitbucket-pipelines.yml',
  'buildspec.yml',
  'appspec.yml',
  'serverless.yml',
  'cloudbuild.yaml',
  'cloudbuild.json',
  'dev.properties',
  'prod.properties',
  'staging.properties',
  'local.properties',
  'gradle.properties',
  'proguard-rules.pro',
  'capacitor.config.json',
  'amplify.yml',
  'vercel.json',
  'netlify.toml',
  'fly.toml',
  'render.yaml',
  'heroku.yml',
  '.nvmrc',
  '.ruby-version',
  '.python-version',
  '.tool-versions',
  'renovate.json',
  'dependabot.yml',
];

const importantDirectories = [
  '/lib/',
  '/src/',
  '/test/',
  '/tests/',
  '/bin/',
  '/example/',
  '/examples/',
  '/api/',
  '/models/',
  '/screens/',
  '/widgets/',
  '/utils/',
  '/services/',
  '/providers/',
  '/hooks/',
  '/pages/',
  '/views/',
  '/routes/',
  '/core/',
  '/features/',
  '/shared/',
  '/common/',
  '/data/',
  '/repositories/',
  '/constants/',
  '/helpers/',
  '/i18n/',
];

const notImportantDirectories = [
  '/build/',
  '/dist/',
  '/node_modules/',
  '/ios/Pods/',
  '/target/',
];

const skipExtensions = [
  '.jpg',
  '.jpeg',
  '.png',
  '.gif',
  '.bmp',
  '.ico',
  '.webp',
  '.mp4',
  '.mp3',
  '.wav',
  '.ogg',
  '.avi',
  '.mov',
  '.pdf',
  '.zip',
  '.rar',
  '.tar',
  '.gz',
  '.ttf',
  '.otf',
  '.woff',
  '.woff2',
  '.dll',
  '.exe',
  '.bin',
  '.dat',
  '.class',
  '.jar',
  '.so',
  '.dylib',
  '.a',
  '.o',
  '.xls',
  '.xlsx',
  '.doc',
  '.docx',
  '.ppt',
  '.pptx',
  '.sql',
];
