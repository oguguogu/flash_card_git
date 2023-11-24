import 'package:flash_card/domain/models/word.dart';
import 'package:flash_card/presentation/widgets/common/alert_dialog/single_button_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flash_card/presentation/provider/provider_in_flash.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/card_input.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/card_result.dart';

class NewInput extends HookConsumerWidget {
  const NewInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(myCardDatabaseProvider);
    final responseState = ref.watch(responseProvider);
    List<String> response = responseState?.split(';') ?? <String>[];
    final inputWord = ref.watch(inputWordProvider);
    final waitingGpt = ref.watch(waitingGptProvider);
    final errorGpt = ref.watch(errorGptProvider);
    var inputTextController = ref.watch(inputTextControllerProvider);
    final carouselController = ref.watch(jumpCarouselControllerProvider);
    final repeatAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 150),
    );

    if (errorGpt) {
      Future.microtask(() => showDialog(
            context: context,
            builder: (context) {
              return SingleButtonDialog(
                  ctx: context,
                  title: '申し訳ございません',
                  content: "通信中にエラーが発生しました",
                  buttonText: 'もう一度試す');
            },
          ).then((_) {
            // ダイアログが閉じられた後の処理
            ref.read(waitingGptProvider.notifier).state = false;
            ref.read(errorGptProvider.notifier).state = false;
            inputTextController.text = "";
            ref.read(responseProvider.notifier).state = null;
            repeatAnimationController.reset();
            // 他の必要な状態のリセット
          }));
    }
    useEffect(() {
      if (waitingGpt && responseState == null) {
        repeatAnimationController.repeat();
        debugPrint(
            '1Effect triggered with waitingGpt: $waitingGpt, responseState: $responseState');
      } else if (response.length == 8) {
        debugPrint(
            '2Effect triggered with waitingGpt: $waitingGpt, responseState: $responseState');
        repeatAnimationController.forward(from: 0).then((_) {
          ref.read(waitingGptProvider.notifier).state = false;
          repeatAnimationController.reset();

          Future.delayed(const Duration(milliseconds: 1000), () async {
            carouselController.animateToPage(0);

            Future.delayed(const Duration(milliseconds: 600), () {
              carouselController.animateToPage(1);
            });
          });
        });
      }
      return () {};
    }, [waitingGpt, responseState]);

    useEffect(() {
      if (!waitingGpt && response.length == 8) {
        Future.delayed(const Duration(milliseconds: 500), () async {
          debugPrint(
              '3Effect triggered with waitingGpt: $waitingGpt, responseState: $responseState');
          debugPrint(inputWord);
          debugPrint(response.toString());
          // List<String> meanings = response[0].split('、');
          // for (int i = 0; i < meanings.length; i++) {
          //   meanings[i] = meanings[i].replaceAll('、', '');
          // }
          // String meaningsVertical = meanings.join('\n');
          // String meanings = response[0].replaceAll('、', '\n');
          // String meaningsVertical = meanings.replaceAll(',', '\n');
          final result = await database.addDatabaseCard(
              inputWord,
              response[0],
              response[1],
              response[2],
              response[3],
              response[4],
              response[5],
              response[6],
              response[7],
              0);
          final word = Word(
            id: result,
            word: inputWord,
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
          debugPrint(
              'Data added successfully: $result and its id is ${word.id}');
          Future.delayed(const Duration(milliseconds: 650), () {
            debugPrint(
                '4Effect triggered with waitingGpt: $waitingGpt, responseState: $responseState');
            inputTextController.text = "";
            ref.read(responseProvider.notifier).state = null;
          });
        });
      }
      return () {};
    }, [waitingGpt]);

    return AnimatedBuilder(
      animation: repeatAnimationController,
      builder: (BuildContext context, Widget? child) {
        final isUnderHalfWay = repeatAnimationController.value < 0.5;
        final displayedChild =
            responseState == null ? const CardInput() : const CardResult();
        final rotationValue =
            repeatAnimationController.value * math.pi * 2; // 2πに調整する
        // 0から1のアニメーションの値を使用して、回転角度を決定
        final rotationAngle =
            isUnderHalfWay ? rotationValue / 2 : rotationValue / 2 + math.pi;

        return Transform(
          // X軸を中心に回転させる
          transform: Matrix4.rotationX(rotationAngle),
          alignment: Alignment.center,
          child: displayedChild,
        );
      },
    );
  }
}
