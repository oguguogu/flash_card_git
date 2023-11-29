import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flash_card/secret.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> sendWordToGPT(BuildContext context, WidgetRef ref,
    TextEditingController controller) async {
  final data = await Supabase.instance.client
      .from('word_list')
      .select(
          'meaning , partOfSpeech, pronunciation,level,collocation, example, derivatives, origin')
      .eq('word', controller.text);

  if (data.isEmpty) {
    try {
      ref.read(supabaseExistedProvider.notifier).state = false;
      final response = await http
          .post(
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
          )
          .timeout(const Duration(seconds: 18));

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
        ref.read(errorGptProvider.notifier).state = true;
      }
    } on TimeoutException catch (_) {
      // タイムアウトエラーの処理
      ref.read(responseProvider.notifier).state = "Error: Request timed out";
      ref.read(errorGptProvider.notifier).state = true;
    } catch (e) {
      // Handle the error or set an error message
      ref.read(responseProvider.notifier).state = "Error: $e";
      ref.read(errorGptProvider.notifier).state = true;
    }
  } else {
    Map<String, dynamic> firstRow = data.first;

    String meaning = firstRow["meaning"] ?? "";
    String partOfSpeech = firstRow["partOfSpeech"] ?? "";
    String pronunciation = firstRow["pronunciation"] ?? "";
    String level = firstRow["level"] ?? "";
    String collocation = firstRow["collocation"] ?? "";
    String example = firstRow["example"] ?? "";
    String derivatives = firstRow["derivatives"] ?? "";
    String origin = firstRow["origin"] ?? "";

    ref.read(responseProvider.notifier).state = "$meaning;$partOfSpeech;"
        "$pronunciation;$level;$collocation;$example;$derivatives;$origin";
  }

  final responseState = ref.watch(responseProvider);

  if (responseState != null && responseState.contains(";")) {
    List<String> response = responseState.split(';');
    if (response.length == 8) {
      debugPrint('complete');
    } else {
      debugPrint('response.length != 8');
      ref.read(errorGptProvider.notifier).state = true;
    }
  } else {
    debugPrint("Invalid or null response received: $responseState");
    ref.read(errorGptProvider.notifier).state = true;
  }
}
