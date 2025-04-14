import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/project_bloc.dart';
import '../bloc/project_events.dart';
import '../bloc/project_state.dart';
import '../../core/navigation/app_router.dart';
import '../../core/theme/common_components.dart';
import 'widgets/project_analysis_section.dart';
import 'widgets/project_evaluation_section.dart';

class ProjectEvaluationScreen extends StatefulWidget {
  const ProjectEvaluationScreen({super.key});

  @override
  State<ProjectEvaluationScreen> createState() =>
      _ProjectEvaluationScreenState();
}

class _ProjectEvaluationScreenState extends State<ProjectEvaluationScreen> {
  final _remarksController = TextEditingController();

  @override
  void dispose() {
    _remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProjectBloc, ProjectState>(
      listener: (context, state) {
        // Update remarks controller when state changes to avoid losing input
        if (state.userRemarks != _remarksController.text) {
          _remarksController.text = state.userRemarks ?? '';
        }
      },
      builder: (context, state) {
        return GradientScaffold(
          appBar: AppBar(
            title: const Text('Project Evaluator'),
            actions: [
              IconButton(
                icon: const Icon(Icons.history),
                tooltip: 'Project History',
                onPressed: () => AppRouter.navigateToHistory(context),
              ),
            ],
          ),
          body:
              state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Project selection
                        AppButton(
                          text: 'Select Project Directory',
                          onPressed: () => _selectProjectDirectory(context),
                          fullWidth: false,
                        ),

                        const SizedBox(height: 16),

                        // Historical view indicator
                        if (state.isHistoricalView)
                          const HistoricalViewBanner(),

                        // Show selected project path
                        if (state.selectedDirectory != null &&
                            state.selectedDirectory!.isNotEmpty)
                          AppCard(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                const Icon(Icons.folder, color: Colors.amber),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    'Project: ${state.selectedDirectory}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        // Analysis section
                        if (state.projectAnalysisResponse != null) ...[
                          const SectionTitle(
                            title: 'Project Analysis',
                            icon: Icons.analytics,
                            fontSize: 22,
                          ),

                          ProjectAnalysisSection(
                            projectSummary:
                                state.projectAnalysisResponse!.projectSummary,
                          ),

                          // User remarks input
                          const SectionTitle(
                            title: 'Your Remarks',
                            icon: Icons.comment,
                            fontSize: 22,
                          ),

                          AppCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  controller: _remarksController,
                                  decoration: const InputDecoration(
                                    hintText:
                                        'Add any observations or specific areas you want evaluated...',
                                    border: OutlineInputBorder(),
                                  ),
                                  maxLines: 3,
                                  enabled:
                                      state.projectEvaluationResponse == null,
                                  style: const TextStyle(fontSize: 16),
                                  onChanged: (value) {
                                    context.read<ProjectBloc>().add(
                                      AddUserRemarksEvent(value),
                                    );
                                  },
                                ),

                                const SizedBox(height: 16),

                                AppButton(
                                  text: 'Evaluate Project',
                                  onPressed:
                                      state.projectEvaluationResponse == null
                                          ? () => _evaluateProject(context)
                                          : null,
                                  fullWidth: true,
                                ),
                              ],
                            ),
                          ),
                        ],

                        // Evaluation result section
                        if (state.projectEvaluationResponse != null) ...[
                          const SectionTitle(
                            title: 'Project Evaluation',
                            icon: Icons.grading,
                            fontSize: 22,
                          ),

                          ProjectEvaluationSection(
                            evaluation: state.projectEvaluationResponse!,
                          ),
                        ],

                        // Error message
                        if (state.errorMessage != null)
                          AppCard(
                            child: Row(
                              children: [
                                const Icon(Icons.error, color: Colors.red),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    state.errorMessage!,
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
        );
      },
    );
  }

  Future<void> _selectProjectDirectory(BuildContext context) async {
    try {
      String? directoryPath = await FilePicker.platform.getDirectoryPath();

      if (directoryPath == null || !context.mounted) {
        // User canceled the picker
        return;
      }

      // Update the project directory in the BLoC
      context.read<ProjectBloc>().add(
        ChooseProjectDirectoryEvent(directoryPath),
      );

      // Trigger analysis
      _analyzeProject(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error selecting directory: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _analyzeProject(BuildContext context) async {
    context.read<ProjectBloc>().add(AnalyzeProjectEvent());
  }

  Future<void> _evaluateProject(BuildContext context) async {
    context.read<ProjectBloc>().add(EvaluateProjectEvent());
  }
}
