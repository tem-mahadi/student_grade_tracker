import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

/// Screen 2: Displays all subjects in a ListView.builder.
///
/// Each item shows name, mark, and grade. Swipe to delete via Dismissible.
/// Rebuilt reactively by `Consumer<SubjectProvider>`.
class SubjectListScreen extends StatelessWidget {
  const SubjectListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Consumer<SubjectProvider>(
        builder: (context, provider, _) {
          if (provider.subjects.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.library_books_outlined,
                    size: 80,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No subjects yet',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add a subject to get started',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 4),
                child: Text(
                  'All Subjects',
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                child: Text(
                  '${provider.totalSubjects} subject${provider.totalSubjects == 1 ? '' : 's'} • Swipe left to delete',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: provider.subjects.length,
                  itemBuilder: (context, index) {
                    final subject = provider.subjects[index];
                    final gradeColor = _gradeColor(subject.grade, colorScheme);

                    return Dismissible(
                      key: UniqueKey(),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 24),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: colorScheme.error,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Icon(
                          Icons.delete_outline,
                          color: colorScheme.onError,
                          size: 28,
                        ),
                      ),
                      onDismissed: (_) {
                        provider.removeSubject(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${subject.name} removed'),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          leading: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: gradeColor.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              subject.grade,
                              style: TextStyle(
                                color: gradeColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          title: Text(
                            subject.name,
                            style: theme.textTheme.titleMedium,
                          ),
                          subtitle: Text(
                            'Mark: ${subject.mark}/100',
                            style: theme.textTheme.bodyMedium,
                          ),
                          trailing: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: gradeColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: gradeColor.withValues(alpha: 0.3),
                              ),
                            ),
                            child: Text(
                              '${subject.mark}',
                              style: TextStyle(
                                color: gradeColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  /// Returns a theme-derived color for each grade letter.
  Color _gradeColor(String grade, ColorScheme colorScheme) {
    switch (grade) {
      case 'A':
        return colorScheme.tertiary;
      case 'B':
        return colorScheme.primary;
      case 'C':
        return colorScheme.secondary;
      default:
        return colorScheme.error;
    }
  }
}
