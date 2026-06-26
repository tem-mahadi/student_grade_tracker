/// Represents an academic subject with a name and mark.
///
/// The [_mark] field is private; access it via the [mark] getter.
/// The [grade] getter computes the letter grade based on the mark.
class Subject {
  final String name;
  final int _mark;

  // ignore: prefer_initializing_formals
  Subject({required this.name, required int mark}) : _mark = mark;

  /// Public getter for the private mark field.
  int get mark => _mark;

  /// Computes the letter grade based on the mark.
  /// - A: mark ≥ 80
  /// - B: mark ≥ 65
  /// - C: mark ≥ 50
  /// - F: mark < 50
  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }
}
