import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/model/project_session_model.dart';
import '../../../core/theme/common_components.dart';
import '../../../core/theme/theme_config.dart';

class HistorySessionCard extends StatelessWidget {
  final ProjectSession session;
  final String projectPath;
  final VoidCallback onDelete;
  final VoidCallback onLoad;

  const HistorySessionCard({
    super.key,
    required this.session,
    required this.projectPath,
    required this.onDelete,
    required this.onLoad,
  });

  @override
  Widget build(BuildContext context) {
    // Format the timestamp for display
    final DateTime timestamp = DateTime.parse(session.timestamp);
    final String formattedDate = DateFormat('MMM dd, yyyy').format(timestamp);
    final String formattedTime = DateFormat('HH:mm').format(timestamp);

    final rating = session.projectEvaluationResponse.overallRating;
    final ratingColor = AppTheme.getRatingColor(rating);

    return Container(
      width: 280,
      height: 200,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: ratingColor.withAlpha(80), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with date and rating
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: ratingColor.withAlpha(20),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.textPrimaryColor.withAlpha(160),
                      ),
                    ),
                  ],
                ),
                RatingBadge(rating: rating, showText: false, fontSize: 16),
              ],
            ),
          ),

          // Session summary
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                session.projectEvaluationResponse.finalSummary,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppTheme.textPrimaryColor,
                ),
                maxLines: 3, // Limit to 3 lines to ensure it fits
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),

          // Action buttons - fixed height
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            // Reduced vertical padding
            decoration: BoxDecoration(
              color: AppTheme.backgroundColor.withAlpha(80),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Delete Session',
                  onPressed: onDelete,
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: Colors.red.withAlpha(160),
                ),
                const SizedBox(width: 16),
                IconButton(
                  icon: const Icon(Icons.open_in_new),
                  tooltip: 'Load Session',
                  onPressed: onLoad,
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  color: AppTheme.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
