class Occurence {
  const Occurence({
    required this.id,
    required this.title,
    this.value,
    required this.text,
    required this.date
  });

  final int id;
  final String title;
  final double? value;
  final String text;
  final DateTime date;
}