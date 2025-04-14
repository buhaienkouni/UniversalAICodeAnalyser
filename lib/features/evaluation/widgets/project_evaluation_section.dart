import 'package:flutter/material.dart';

import '../../../core/model/project_evaluator_models.dart';
import '../../../core/theme/common_components.dart';
import '../../../core/theme/theme_config.dart';

class ProjectEvaluationSection extends StatelessWidget {
  final ProjectEvaluationResponse evaluation;

  const ProjectEvaluationSection({super.key, required this.evaluation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Overall rating card
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Overall Rating',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimaryColor,
                    ),
                  ),
                  const Spacer(),
                  RatingBadge(rating: evaluation.overallRating, fontSize: 18),
                ],
              ),

              const SizedBox(height: 16),

              Text(
                evaluation.finalSummary,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppTheme.textPrimaryColor,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Category scores
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Category Scores',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),

              const SizedBox(height: 16),

              _buildCategoryScore(
                'Suitability',
                evaluation.evaluation.suitability.score,
                Icons.check_circle,
              ),
              _buildCategoryScore(
                'System Architecture',
                evaluation.evaluation.systemArchitecture.score,
                Icons.architecture,
              ),
              _buildCategoryScore(
                'Technical Implementation',
                evaluation.evaluation.technicalImplementation.score,
                Icons.code,
              ),
              _buildCategoryScore(
                'User Experience & Interface',
                evaluation.evaluation.userExperienceInterface.score,
                Icons.devices,
              ),
              _buildCategoryScore(
                'Security & Privacy',
                evaluation.evaluation.securityPrivacy.score,
                Icons.security,
              ),
            ],
          ),
        ),

        // Detailed category sections
        const SectionTitle(title: 'Detailed Evaluation', icon: Icons.analytics),

        _buildCategoryDetails(
          'Suitability',
          evaluation.evaluation.suitability,
          Icons.check_circle,
        ),

        _buildCategoryDetails(
          'System Architecture',
          evaluation.evaluation.systemArchitecture,
          Icons.architecture,
        ),

        _buildCategoryDetails(
          'Technical Implementation',
          evaluation.evaluation.technicalImplementation,
          Icons.code,
        ),

        _buildCategoryDetails(
          'User Experience & Interface',
          evaluation.evaluation.userExperienceInterface,
          Icons.devices,
        ),

        _buildCategoryDetails(
          'Security & Privacy',
          evaluation.evaluation.securityPrivacy,
          Icons.security,
        ),
      ],
    );
  }

  Widget _buildCategoryScore(String name, double score, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.getRatingColor(score), size: 20),
          const SizedBox(width: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 16,
              color: AppTheme.textPrimaryColor,
            ),
          ),
          const Spacer(),
          RatingBadge(rating: score, showText: false),
          const SizedBox(width: 4),
          Text(
            '/ 10',
            style: TextStyle(
              fontSize: 14,
              color: AppTheme.getRatingColor(score),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryDetails(
    String name,
    EvaluationCategory category,
    IconData icon,
  ) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.getRatingColor(category.score)),
              const SizedBox(width: 12),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimaryColor,
                ),
              ),
              const Spacer(),
              RatingBadge(rating: category.score, showText: false),
            ],
          ),

          const SizedBox(height: 16),

          _buildEvaluationSection(
            'Strengths',
            category.strengths,
            Icons.trending_up,
            AppTheme.ratingExcellent,
          ),

          const SizedBox(height: 12),

          _buildEvaluationSection(
            'Areas for Improvement',
            category.areasForImprovement,
            Icons.trending_down,
            AppTheme.ratingPoor,
          ),

          const SizedBox(height: 12),

          _buildEvaluationSection(
            'Recommendations',
            category.recommendations,
            Icons.lightbulb,
            AppTheme.ratingGood,
          ),
        ],
      ),
    );
  }

  Widget _buildEvaluationSection(
    String title,
    List<String> items,
    IconData icon,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 26),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppTheme.textPrimaryColor,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
