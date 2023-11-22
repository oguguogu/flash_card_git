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
        "model": "ft:gpt-3.5-turbo-0613:personal::8Hz70ef7",
        "messages": [
          {
            "role": "system",
            "content":
                "You are a Japanese assistant that provides definitions, pronunciations, levels, collocations, example sentences, and etymologies for English words separated by semicolons."
          },
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
    if (response.length == 6) {
      final word = Word(
        word: controller.text,
        meaning: response[0],
        pronunciation: response[1],
        level: response[2],
        collocation: response[3],
        example: response[4],
        origin: response[5],
        memorizedType: 0,
      );
      ref.read(wordListsProvider.notifier).state = [
        word,
        ...ref.read(wordListsProvider),
      ];
    } else {
      debugPrint('response.length != 6');
      ref.read(errorGptProvider.notifier).state = true;
    }
  } else {
    debugPrint("Invalid or null response received: $responseState");
    ref.read(errorGptProvider.notifier).state = true;
  }
}
