import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flash_card/secret.dart';
import 'package:flash_card/presentation/provider/provider_in_flash.dart';
import 'package:flash_card/domain/models/word.dart';

Future<void> sendWordToGPT(BuildContext context, WidgetRef ref,
    TextEditingController controller) async {
  try {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Authorization': 'Bearer $key',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "model": wordCreateModel2,
        "messages": [
          {"role": "system", "content": wordCreateSystem2},
          {
            "role": "user",
            "content": "What does the word '${controller.text}' mean?",
          }
        ],
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(utf8.decode(response.body.codeUnits))
          as Map<String, dynamic>;
      final content = (jsonResponse['choices'] as List).first['message']
          ['content'] as String;
      // Update the state using the provider
      ref.read(responseProvider.notifier).state = content;
    } else {
      // Handle the error or set an error message
      ref.read(responseProvider.notifier).state =
          "Error: ${response.statusCode}";
    }
  } catch (e) {
    // Handle the error or set an error message
    ref.read(responseProvider.notifier).state = "Error: $e";
  }
  final responseState = ref.watch(responseProvider);
  debugPrint(responseState.toString());

  if (responseState != null && responseState.contains(";")) {
    List<String> response = responseState.split(';');
    if (response.length == 8) {
      final word = Word(
        id: null,
        word: controller.text,
        meaning: response[0],
        partOfSpeech: response[1],
        pronunciation: response[2],
        level: response[3],
        collocation: response[4],
        example: response[5],
        derivatives: response[6],
        origin: response[7],
        memorizedType: 0,
      );
      ref.read(wordListsProvider.notifier).state = [
        word,
        ...ref.read(wordListsProvider),
      ];
    } else {
      debugPrint('response.length != 8');
      ref.read(errorGptProvider.notifier).state = true;
    }
  } else {
    debugPrint("Invalid or null response received: $responseState");
    ref.read(errorGptProvider.notifier).state = true;
  }
}
