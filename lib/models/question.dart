class Question {
  final int id;
  final String text;
  final List<Option> options;

  Question({
    required this.id,
    required this.text,
    required this.options,
  });
}

class Option {
  final String text;
  final String dimension;

  Option({
    required this.text,
    required this.dimension,
  });
}