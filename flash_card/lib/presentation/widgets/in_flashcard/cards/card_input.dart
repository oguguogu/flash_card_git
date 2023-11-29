import 'package:flash_card/presentation/theme/sizes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';

class CardInput extends HookConsumerWidget {
  const CardInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputWord = ref.watch(inputWordProvider);
    return Center(
      child: SizedBox(
        width: RawSize.p300, // カードの幅
        height: RawSize.p200, // カードの高さ
        child: Card(
          color: const Color.fromARGB(255, 189, 189, 189),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                inputWord,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: RawSize.p34, // フォントサイズを大きく
                  fontWeight: FontWeight.bold, // フォントウェイトを太く
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
