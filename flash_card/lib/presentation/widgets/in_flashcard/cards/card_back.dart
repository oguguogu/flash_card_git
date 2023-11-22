import 'package:flutter/material.dart';
import 'package:flash_card/domain/models/word.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/card_content.dart';

// 裏面のカードを表示するウィジェット
class CardBack extends StatelessWidget {
  final Word word;
  const CardBack({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String meanings = word.meaning.replaceAll('、', '\n');
    String meaningsVertical = meanings.replaceAll(',', '\n');
    return CardContent(null,
        text: meaningsVertical, collocationKey: word.collocation); // 裏面のテキスト
  }
}
