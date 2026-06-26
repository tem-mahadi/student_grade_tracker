import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/subject.dart';
import '../providers/subject_provider.dart';

/// Screen 1: Form to add a new subject with name and mark.
///
/// Uses Provider exclusively — zero setState calls.
class AddSubjectScreen extends StatelessWidget {
  const AddSubjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            // Header
            Text(
              'Add New Subject',
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              'Enter subject details below',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 24),
            // Form card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: _AddSubjectForm(),
              ),
            ),
            const SizedBox(height: 24),
            // Quick info card
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.info_outline,
                            size: 20, color: colorScheme.primary),
                        const SizedBox(width: 8),
                        Text('Grading Scale',
                            style: theme.textTheme.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _gradeRow(context, 'A', '80 – 100', colorScheme.tertiary),
                    _gradeRow(context, 'B', '65 – 79', colorScheme.primary),
                    _gradeRow(context, 'C', '50 – 64', colorScheme.secondary),
                    _gradeRow(context, 'F', '0 – 49', colorScheme.error),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gradeRow(
      BuildContext context, String grade, String range, Color color) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              grade,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(range, style: theme.textTheme.bodyMedium),
        ],
      ),
    );
  }
}

/// The actual form widget — uses a `GlobalKey<FormState>` for validation.
/// No setState: text field values are read from controllers on submit.
class _AddSubjectForm extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _markController = TextEditingController();

  _AddSubjectForm();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Subject name
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Subject Name',
              hintText: 'e.g. Mathematics',
              prefixIcon: Icon(Icons.book_outlined),
            ),
            textCapitalization: TextCapitalization.words,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter the subject name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          // Mark
          TextFormField(
            controller: _markController,
            decoration: const InputDecoration(
              labelText: 'Mark (0 – 100)',
              hintText: 'e.g. 85',
              prefixIcon: Icon(Icons.grade_outlined),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter the mark';
              }
              final mark = int.tryParse(value.trim());
              if (mark == null) {
                return 'Mark must be a number';
              }
              if (mark < 0 || mark > 100) {
                return 'Mark must be between 0 and 100';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          // Submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _submit(context),
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Add Subject'),
            ),
          ),
        ],
      ),
    );
  }

  void _submit(BuildContext context) {
    if (!_formKey.currentState!.validate()) return;

    final name = _nameController.text.trim();
    final mark = int.parse(_markController.text.trim());
    final subject = Subject(name: name, mark: mark);

    context.read<SubjectProvider>().addSubject(subject);

    _nameController.clear();
    _markController.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name added with grade ${subject.grade}'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
