import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

/// Screen 3: Summary showing total subjects, average mark, overall grade,
/// and count of passing subjects.
///
/// Updates live via `Consumer<SubjectProvider>`.
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

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
                    Icons.analytics_outlined,
                    size: 80,
                    color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No data yet',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Add subjects to see your summary',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }

          final overallGradeColor =
              _gradeColor(provider.overallGrade, colorScheme);

          // Build the list of passing subject names using .where() and .map()
          final passingSubjectNames = provider.subjects
              .where((s) => s.grade != 'F')
              .map((s) => s.name)
              .toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text('Result Summary', style: theme.textTheme.headlineMedium),
                const SizedBox(height: 4),
                Text(
                  'Your academic performance at a glance',
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 24),

                // Overall grade hero card
                Card(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    child: Column(
                      children: [
                        Text('Overall Grade', style: theme.textTheme.titleMedium),
                        const SizedBox(height: 12),
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: overallGradeColor.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: overallGradeColor.withValues(alpha: 0.4),
                              width: 3,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            provider.overallGrade,
                            style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: overallGradeColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Average: ${provider.averageMark.toStringAsFixed(1)}',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: overallGradeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Stats row
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.menu_book_outlined,
                        label: 'Total',
                        value: '${provider.totalSubjects}',
                        color: colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.check_circle_outline,
                        label: 'Passing',
                        value: '${provider.passingCount}',
                        color: colorScheme.tertiary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.cancel_outlined,
                        label: 'Failing',
                        value: '${provider.totalSubjects - provider.passingCount}',
                        color: colorScheme.error,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Passing subjects list
                if (passingSubjectNames.isNotEmpty) ...[
                  Text('Passing Subjects',
                      style: theme.textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: passingSubjectNames
                            .map((name) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    children: [
                                      Icon(Icons.check_circle,
                                          size: 18,
                                          color: colorScheme.tertiary),
                                      const SizedBox(width: 8),
                                      Text(name,
                                          style: theme.textTheme.bodyLarge),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

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

/// A small stat card used in the summary row.
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
