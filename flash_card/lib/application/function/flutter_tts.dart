import 'package:flutter_tts/flutter_tts.dart';

Future<void> speak(String text) async {
  await FlutterTts().setLanguage("en-US");
  await FlutterTts().setPitch(1);
  await FlutterTts().setSpeechRate(0.5);
  await FlutterTts().speak(text);
}

Future<void> stop() async {
  await FlutterTts().stop();
}
