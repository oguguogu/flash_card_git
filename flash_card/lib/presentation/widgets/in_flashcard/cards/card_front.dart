import 'package:flash_card/presentation/widgets/common/button/tts_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/domain/models/word.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/card_content.dart';

// 表面のカードを表示するウィジェット
class CardFront extends StatelessWidget {
  final Word word;
  const CardFront({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardContent(
      TtsIconButton(word: word.word),
      text: word.word,
      idKey: word.id,
    ); // 表面のテキスト
  }
}
