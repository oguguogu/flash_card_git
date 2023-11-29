import 'package:carousel_slider/carousel_slider.dart';
import 'package:flash_card/presentation/widgets/common/alert_dialog/horizon_buttons_dialog.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flash_card/application/function/send_word_to_gpt.dart';
import 'package:flash_card/infrastructure/database/database_books.dart';

class SendWordForm extends HookConsumerWidget {
  const SendWordForm({super.key, required this.carouselController});
  final CarouselController carouselController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    final inputTextController = ref.watch(inputTextControllerProvider);
    final focusNode = useFocusNode();
    final theme = Theme.of(context);

    useEffect(() {
      void listener() {
        ref.read(inputWordProvider.notifier).state = inputTextController.text;
      }

      inputTextController.addListener(listener);
      return () => inputTextController.removeListener(listener);
    }, [inputTextController]);

    useEffect(() {
      void onFocusChange() {
        if (focusNode.hasFocus) {
          carouselController.animateToPage(1);
          ref.watch(sliderValueProvider.notifier).state = 0;
        }
      }

      focusNode.addListener(onFocusChange);
      return () => focusNode.removeListener(onFocusChange);
    }, [focusNode]);

    final RegExp alphaPattern = RegExp(r'^[a-zA-Z]+([-\s][a-zA-Z]+)*$');

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 60,
            width: 300,
            child: Form(
              key: formKey,
              child: TextFormField(
                maxLength: 15,
                controller: inputTextController,
                focusNode: focusNode,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: theme.primaryColor, // テーマからプライマリーカラーを使用
                  fontWeight: FontWeight.bold,
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 15 ||
                      !alphaPattern.hasMatch(value)) {
                    return 'Please enter a valid word';
                  }
                  return null;
                },
                cursorColor: theme.primaryColorDark,
                decoration: InputDecoration(
                    hintText: '新しい単語を覚える',
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 1.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide:
                          const BorderSide(color: Colors.red, width: 2.0),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: theme.shadowColor, // ボタンの影の色
              elevation: 10, // 影の深さを設定
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // ボタンの角を丸く
              ),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            onPressed: () async {
              if (!formKey.currentState!.validate()) {
                return;
              }

              final word = inputTextController.text;
              final wordAlreadyExists = await MyBookDatabase().wordExists(word);

              if (wordAlreadyExists) {
                // HorizonButtonsDialogを使用して確認ダイアログを表示
                // ignore: use_build_context_synchronously
                final proceed = await showDialog<bool>(
                  context: context,
                  builder: (BuildContext context) {
                    return HorizonButtonsDialog(
                        "確認",
                        "$word は既にデータベースに存在します。それでも続けますか？",
                        "はい",
                        "いいえ",
                        () {},
                        () {});
                  },
                );

                // ダイアログの結果に基づいて処理を続行
                if (proceed == true) {
                  ref.read(waitingGptProvider.notifier).state = true;
                  // ignore: use_build_context_synchronously
                  sendWordToGPT(context, ref, inputTextController);
                }
              } else {
                ref.read(waitingGptProvider.notifier).state = true;
                // ignore: use_build_context_synchronously
                sendWordToGPT(context, ref, inputTextController);
              }
            },
            child: const Text('覚える'),
          ),
        ],
      ),
    );
  }
}
