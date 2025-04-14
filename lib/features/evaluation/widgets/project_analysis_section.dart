import 'package:flutter/material.dart';

import '../../../core/model/project_analyzer_models.dart';
import '../../../core/theme/common_components.dart';
import '../../../core/theme/theme_config.dart';

class ProjectAnalysisSection extends StatelessWidget {
  final ProjectSummary projectSummary;

  const ProjectAnalysisSection({super.key, required this.projectSummary});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Project: ${projectSummary.projectName}',
            style: AppTheme.subheadingStyle,
          ),

          const SizedBox(height: 16),

          _buildInfoRow(Icons.description, 'Purpose', projectSummary.purpose),
          _buildInfoRow(
            Icons.architecture,
            'Architecture',
            projectSummary.architecture,
          ),

          const SizedBox(height: 16),

          const Text(
            'Key Features',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),

          const SizedBox(height: 8),

          ...projectSummary.keyFeatures.map(
            (feature) => _buildFeatureItem(feature),
          ),

          const SizedBox(height: 16),

          const Text(
            'Technologies',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimaryColor,
            ),
          ),

          const SizedBox(height: 8),

          _buildTechStack(projectSummary.technologies),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppTheme.textPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: AppTheme.accentColor, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              feature,
              style: const TextStyle(
                fontSize: 16,
                color: AppTheme.textPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechStack(Technologies technologies) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor.withAlpha(80),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTechItem(
            Icons.code,
            'Languages',
            technologies.languages.join(', '),
          ),
          const SizedBox(height: 8),
          _buildTechItem(Icons.devices, 'Framework', technologies.framework),
          const SizedBox(height: 8),
          _buildTechItem(Icons.storage, 'Backend', technologies.backend),
          const SizedBox(height: 8),
          _buildTechItem(Icons.data_usage, 'Database', technologies.database),
        ],
      ),
    );
  }

  Widget _buildTechItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.accentColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            children: [
              Text(
                '$label: ',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textSecondaryColor,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
