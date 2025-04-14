import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/project_bloc.dart';
import '../bloc/project_events.dart';
import '../bloc/project_state.dart';
import '../../core/model/project_history_item_model.dart';
import '../../core/theme/common_components.dart';
import '../../core/theme/theme_config.dart';
import 'widgets/history_session_card.dart';

class ProjectHistoryScreen extends StatefulWidget {
  const ProjectHistoryScreen({super.key});

  @override
  State<ProjectHistoryScreen> createState() => _ProjectHistoryScreenState();
}

class _ProjectHistoryScreenState extends State<ProjectHistoryScreen> {
  @override
  void initState() {
    super.initState();
    // Load project history when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<ProjectBloc>().add(LoadAllProjectsEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBar: AppBar(
        title: const Text('Project History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      // Change from BlocBuilder to BlocConsumer to handle state changes
      body: BlocConsumer<ProjectBloc, ProjectState>(
        // Only rebuild when projectHistory changes
        buildWhen:
            (previous, current) =>
                previous.projectHistory != current.projectHistory ||
                previous.isLoading != current.isLoading,
        // Only listen for specific state changes
        listenWhen:
            (previous, current) =>
                previous.projectHistory != current.projectHistory,
        // Empty listener to trigger rebuild when state changes
        listener: (context, state) {},
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.projectHistory == null || state.projectHistory!.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.history_toggle_off,
                    size: 64,
                    color: AppTheme.textSecondaryColor,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'No project history available',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  AppButton(
                    text: 'Return to Evaluation',
                    icon: Icons.arrow_back,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  state.projectHistory!.map((project) {
                    return _buildProjectSection(context, project);
                  }).toList(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProjectSection(
    BuildContext context,
    ProjectHistoryItem project,
  ) {
    // Get the project name from the path
    final pathParts = project.projectPath.split('/');
    final projectName =
        pathParts.isNotEmpty ? pathParts.last : 'Unknown Project';

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      projectName.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      project.projectPath,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Delete Project History',
                onPressed: () {
                  _showDeleteConfirmationDialog(
                    context,
                    project.projectPath,
                    '',
                    isSession: false,
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Session cards in a horizontal scrollable layout
          SizedBox(
            height: 200, // Fixed height for the session cards row
            child:
                project.sessions.isEmpty
                    ? const Center(
                      child: Text(
                        'No sessions available',
                        style: TextStyle(color: AppTheme.textSecondaryColor),
                      ),
                    )
                    : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: project.sessions.length,
                      itemBuilder: (context, index) {
                        return HistorySessionCard(
                          session: project.sessions[index],
                          projectPath: project.projectPath,
                          onDelete: () {
                            _showDeleteConfirmationDialog(
                              context,
                              project.projectPath,
                              project.sessions[index].timestamp,
                              isSession: true,
                            );
                          },
                          onLoad: () {
                            // Load the session
                            context.read<ProjectBloc>().add(
                              LoadProjectSessionEvent(
                                projectPath: project.projectPath,
                                timestamp: project.sessions[index].timestamp,
                              ),
                            );
                            // Navigate back to the main screen
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(
    BuildContext context,
    String projectPath,
    String timestamp, {
    bool isSession = true,
  }) {
    final String entityType = isSession ? 'session' : 'project';

    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            backgroundColor: AppTheme.cardColor,
            title: Text(
              'Delete $entityType?',
              style: const TextStyle(color: AppTheme.textPrimaryColor),
            ),
            content: Text(
              'Are you sure you want to delete this $entityType? This action cannot be undone.',
              style: const TextStyle(color: AppTheme.textPrimaryColor),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(dialogContext).pop();

                  if (isSession) {
                    context.read<ProjectBloc>().add(
                      DeleteProjectSessionEvent(
                        projectPath: projectPath,
                        timestamp: timestamp,
                      ),
                    );
                  } else {
                    context.read<ProjectBloc>().add(
                      DeleteProjectEvent(projectPath),
                    );
                  }
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }
}
