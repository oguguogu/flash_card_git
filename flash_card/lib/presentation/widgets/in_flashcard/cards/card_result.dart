import 'package:flash_card/presentation/theme/sizes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';

class CardResult extends ConsumerWidget {
  const CardResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseState = ref.watch(responseProvider);
    List<String> response = responseState?.split(';') ?? <String>[];
    // List<String> meanings = response[0].split('、');
    // for (int i = 0; i < meanings.length; i++) {
    //   meanings[i] = meanings[i].replaceAll('、', '');
    // }
    // String meaningsVertical = meanings.join('\n');
    String meanings = response[0].replaceAll('、', '\n');
    String meaningsVertical = meanings.replaceAll(',', '\n');

    // double fontSize;
    // switch (meanings.length) {
    //   case 1:
    //     fontSize = RawSize.p48;
    //     break;
    //   case 2:
    //     fontSize = RawSize.p32;
    //     break;
    //   case 3:
    //     fontSize = RawSize.p28;
    //     break;
    //   default:
    //     fontSize = RawSize.p18;
    //     break;
    // }

    return Center(
      child: SizedBox(
        width: RawSize.p300, // カードの幅
        height: RawSize.p200, // カードの高さ
        child: Card(
          color: const Color.fromARGB(255, 189, 189, 189),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                response.length == 8
                    ? meaningsVertical
                    : '申し訳ございません。\n 予期せぬ不具合が発生しました。',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32, // フォントサイズを大きく
                  fontWeight: FontWeight.bold, // フォントウェイトを太く
                ),
                textAlign: TextAlign.center, // テキストを中央寄せ
              ),
            ),
          ),
        ),
      ),
    );
  }
}
