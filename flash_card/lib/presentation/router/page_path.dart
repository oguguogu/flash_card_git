/// 画面ID
enum PageId {
  flash,
  vocab,
  sentence,
}

/// 画面パス
extension PagePath on PageId {
  String get path => switch (this) {
        PageId.flash => '/flash',
        PageId.vocab => '/vocab',
        PageId.sentence => '/sentence',
      };
}

/// 画面名
extension PageName on PageId {
  String get routeName => switch (this) {
        PageId.flash => 'flash',
        PageId.vocab => 'vocab',
        PageId.sentence => 'sentence',
      };
}
