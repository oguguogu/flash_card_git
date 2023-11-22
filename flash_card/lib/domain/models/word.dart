class Word {
  const Word({
    required this.word,
    required this.meaning,
    required this.pronunciation,
    required this.level,
    required this.collocation,
    required this.example,
    required this.origin,
    required this.memorizedType,
  });

  final String word;
  final String meaning;
  final String pronunciation;
  final String level;
  final String collocation;
  final String example;
  final String origin;
  final int memorizedType;
}
