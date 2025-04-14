import 'dart:developer';
import 'dart:math' as math;

/// Helper method to create batches of file messages
/// Each batch contains as many files as possible without exceeding maxCharacters
List<String> createFileMessageContentBatches(
  Map<String, String> projectFilePathsWithContent,
  int maxCharacters,
) {
  final List<String> batchMessages = [];
  String currentBatch = '';

  log('Creating batches with max size: $maxCharacters');
  log('Total files to process: ${projectFilePathsWithContent.length}');

  // Sort files by size (smallest first) for better batching
  final sortedEntries =
      projectFilePathsWithContent.entries.toList()
        ..sort((a, b) => a.value.length.compareTo(b.value.length));

  for (var entry in sortedEntries) {
    final String filePath = entry.key;
    final String fileContent = entry.value;
    final String fileHeader = 'File name with path: $filePath\nFile content:\n';
    final String fullFileEntry = '$fileHeader$fileContent\n\n';

    log('Processing file: $filePath (length: ${fileContent.length})');

    // Skip empty files
    if (fileContent.trim().isEmpty) {
      log('Skipping empty file: $filePath');
      continue;
    }

    // Case 1: File fits in a single batch
    if (fullFileEntry.length <= maxCharacters) {
      // Check if adding this file would overflow the current batch
      if (currentBatch.length + fullFileEntry.length > maxCharacters) {
        // Save current batch and start a new one
        batchMessages.add(currentBatch);
        currentBatch = fullFileEntry;
        log('Starting new batch with file: $filePath');
      } else {
        // Add file to current batch
        currentBatch += fullFileEntry;
        log('Added file to current batch: $filePath');
      }
    }
    // Case 2: File needs to be split into chunks
    else {
      log('File too large, splitting into chunks: $filePath');

      // If current batch has content, finalize it
      if (currentBatch.isNotEmpty) {
        batchMessages.add(currentBatch);
        currentBatch = '';
        log('Finalized current batch before large file');
      }

      int startIndex = 0;
      int chunkCount = 0;

      while (startIndex < fileContent.length) {
        // First chunk includes header
        final bool isFirstChunk = startIndex == 0;
        final String chunkPrefix =
            isFirstChunk ? fileHeader : '(continued...) ';
        final String chunkSuffix =
            startIndex + maxCharacters < fileContent.length
                ? '\n\n(continued...)'
                : '\n\n';

        // Calculate available space for content
        final int availableSpace =
            maxCharacters - chunkPrefix.length - chunkSuffix.length;
        final int endIndex = math.min(
          startIndex + availableSpace,
          fileContent.length,
        );

        // Create the chunk
        final String chunkContent = fileContent.substring(startIndex, endIndex);
        final String chunkMessage = chunkPrefix + chunkContent + chunkSuffix;

        // Add chunk as its own batch
        batchMessages.add(chunkMessage);
        log(
          'Added chunk ${++chunkCount} as batch (size: ${chunkMessage.length})',
        );

        // Move to next chunk
        startIndex = endIndex;
      }

      // Reset current batch since we've processed this large file separately
      currentBatch = '';
    }
  }

  // Add the final batch if it has content
  if (currentBatch.isNotEmpty) {
    batchMessages.add(currentBatch);
    log('Added final batch (size: ${currentBatch.length})');
  }

  log('Created ${batchMessages.length} batches');

  // Validate no empty batches
  final emptyBatches =
      batchMessages.where((batch) => batch.trim().isEmpty).length;
  if (emptyBatches > 0) {
    log('WARNING: Found $emptyBatches empty batches');
  }

  return batchMessages;
}

/// Helper method to estimate the number of tokens in a text.
/// It may be not accurate cos OpenAI does not provide any information about
/// tokenization.
int estimateTokensInText(String text) {
  // Split text into words based on whitespace
  final List<String> words = text.split(RegExp(r'\s+'));
  int tokenCount = 0;

  // Process each word
  for (final word in words) {
    // Count the basic word
    tokenCount++;

    // Add token for punctuation and special characters
    if (word.contains(RegExp(r'[^\w\s]'))) {
      tokenCount++;
    }

    // Add tokens for longer words (1 token per 4 characters over 8)
    if (word.length > 8) {
      tokenCount += (word.length - 8) ~/ 4;
    }

    // Add token for code-specific symbols
    if (word.contains(RegExp(r'[{}()[\];:]'))) {
      tokenCount++;
    }
  }

  // Add adjustment factor for very long texts
  tokenCount += (words.length / 100).floor();

  // Apply scaling factor based on model tests (0.35)
  return (tokenCount * 0.35).floor();
}
