// import 'dart:convert';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flash_card/secret.dart';

// final responseProvider = StateProvider<String?>((ref) => null);

// class ChatGpt extends HookConsumerWidget {
//   const ChatGpt({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final controller = useTextEditingController();
//     final responseState = ref.watch(responseProvider);

//     Future<void> sendToGPT() async {
//       try {
//         final response = await http.post(
//           Uri.parse('https://api.openai.com/v1/chat/completions'),
//           headers: {
//             'Authorization': 'Bearer $key',
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode({
//             "model": "gpt-3.5-turbo",
//             "messages": [
//               {
//                 "role": "user",
//                 "content":
//                     "${controller.text}を日本語で意味だけを教えてください。例えばexhilartionと送られたなら「高揚感」だけ返してください。",
//               }
//             ],
//           }),
//         );

//         if (response.statusCode == 200) {
//           final jsonResponse = jsonDecode(utf8.decode(response.body.codeUnits))
//               as Map<String, dynamic>;

//           final content = (jsonResponse['choices'] as List).first['message']
//               ['content'] as String;

//           // Update the state using the provider
//           ref.read(responseProvider.notifier).state = content;
//         } else {
//           // Handle the error or set an error message
//           ref.read(responseProvider.notifier).state =
//               "Error: ${response.statusCode}";
//         }
//       } catch (e) {
//         // Handle the error or set an error message
//         ref.read(responseProvider.notifier).state = "Error: $e";
//       }
//     }

//     return Scaffold(
//       appBar: AppBar(title: const Text('Chat GPT')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextFormField(
//                 controller: controller,
//                 style: const TextStyle(color: Colors.white)),
//             if (responseState == null)
//               const Text(
//                 '結果はまだありません',
//                 style: TextStyle(
//                   color: Colors.white,
//                 ),
//               )
//             else
//               Text(
//                 responseState,
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ElevatedButton(
//               onPressed: () {
//                 sendToGPT();
//               },
//               child: const Text('送信'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
