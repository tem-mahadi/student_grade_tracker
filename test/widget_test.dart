
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:student_grade_tracker/main.dart';
import 'package:student_grade_tracker/providers/subject_provider.dart';
import 'package:student_grade_tracker/providers/theme_provider.dart';

void main() {
  testWidgets('App renders with bottom navigation', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SubjectProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const StudentGradeTrackerApp(),
      ),
    );

    // Verify the bottom navigation items are present
    expect(find.text('Add'), findsOneWidget);
    expect(find.text('Subjects'), findsOneWidget);
    expect(find.text('Summary'), findsOneWidget);
  });
}
