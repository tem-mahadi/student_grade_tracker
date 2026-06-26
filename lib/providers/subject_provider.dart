import 'package:flutter/foundation.dart';
import '../models/subject.dart';

/// Manages the list of subjects and provides computed statistics.
///
/// All state mutations go through this provider — no setState anywhere.
class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];

  /// Unmodifiable view of the subjects list.
  List<Subject> get subjects => List.unmodifiable(_subjects);

  /// Total number of subjects added.
  int get totalSubjects => _subjects.length;

  /// Number of passing subjects (grade != F) using .where().
  int get passingCount =>
      _subjects.where((subject) => subject.grade != 'F').length;

  /// Average mark across all subjects, using .map() to extract marks.
  double get averageMark {
    if (_subjects.isEmpty) return 0.0;
    final totalMarks =
        _subjects.map((subject) => subject.mark).reduce((a, b) => a + b);
    return totalMarks / _subjects.length;
  }

  /// Overall grade based on the average mark.
  String get overallGrade {
    final avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  /// Adds a new subject and notifies listeners.
  void addSubject(Subject subject) {
    _subjects.add(subject);
    notifyListeners();
  }

  /// Removes a subject at the given index and notifies listeners.
  void removeSubject(int index) {
    _subjects.removeAt(index);
    notifyListeners();
  }
}
