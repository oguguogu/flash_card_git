import 'package:flutter/material.dart';
import 'package:flash_card/application/function/flutter_tts.dart';

class TtsIconButton extends StatelessWidget {
  const TtsIconButton({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: IconButton(
        splashRadius: 15,
        icon: const Icon(Icons.volume_up),
        onPressed: () {
          speak(word);
        },
      ),
    );
  }
}
