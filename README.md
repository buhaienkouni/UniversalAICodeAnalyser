# Universal AI Code Analyzer

A Flutter-based application that uses OpenAI's API to analyze and evaluate code projects across multiple programming languages and frameworks.

## Features

- **Project Analysis**: Scan and analyze code projects in any directory
- **AI-Powered Evaluation**: Leverage OpenAI's API for comprehensive code review
- **Detailed Reports**: Get evaluations across multiple categories including:
    - Project suitability
    - System architecture
    - Technical implementation
    - User experience/interface
    - Security and privacy
- **Rating System**: Visual representation of project health with color-coded ratings
- **Project History**: Store and review previous analyses for progress tracking
- **Large Project Support**: Efficiently process large codebases through advanced batching and filtering

## Technical Details

- Built with Flutter/Dart for cross-platform support
- Implements BLoC pattern for state management
- Uses GetIt for dependency injection
- Stores project history using a local JSON-based database
- Efficiently handles large projects through file filtering and batch processing

## Getting Started

1. Clone the repository
```
git clone git@github.com:OlehBuhaienkoDev/universalCodeAnalyser.git
```

2. Set up environment variables

Create a file named `env_var.dart` in the `lib/core/config/` directory with your OpenAI credentials:

```dart
class EnvVar {
  // OpenAI API Base URL
  static const String openAiBaseUrl = 'https://api.openai.com/v1';

  // Assistant IDs
  static const String analyzerAssistantId = 'YOUR_ANALYZER_ASSISTANT_ID';
  static const String evaluatorAssistantId = 'YOUR_EVALUATOR_ASSISTANT_ID';

  // API Authentication
  static const String apiKey = 'YOUR_OPENAI_API_KEY';
  static const String orgId = 'YOUR_OPENAI_ORG_ID';
  static const String projectId = 'YOUR_OPENAI_PROJECT_ID';

  // Static getters
  static String get openAiBaseUrl => openAiBaseUrl;
  static String get analyzerAssistantId => analyzerAssistantId;
  static String get evaluatorAssistantId => evaluatorAssistantId;
  static String get apiKey => apiKey;
  static String get orgId => orgId;
  static String get projectId => projectId;
}
```

**Note:** Make sure to add `env_var.dart` to your `.gitignore` file to keep your API keys secure.

3. Install dependencies
```
flutter pub get
```

4. Run the application
```
flutter run
```

## Project Structure

The project follows a multi-layered architecture:
- `/lib` - Main application code
    - `/core` - Core components (API, config, models, services)
    - `/features` - Functional modules (BLoC, screens, components)

## License

MIT License

## Contributors

- Oleh Buhaienko