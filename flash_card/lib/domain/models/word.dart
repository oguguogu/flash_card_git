class Word {
  const Word({
    required this.id,
    required this.word,
    required this.meaning,
    required this.partOfSpeech,
    required this.pronunciation,
    required this.level,
    required this.collocation,
    required this.example,
    required this.derivatives,
    required this.origin,
    required this.memorizedType,
  });

  final int id;
  final String word;
  final String meaning;
  final String partOfSpeech;
  final String pronunciation;
  final String level;
  final String collocation;
  final String example;
  final String? derivatives;
  final String origin;
  final int memorizedType;
}
