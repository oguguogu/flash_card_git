import 'package:flutter/material.dart';
import 'package:flash_card/domain/models/word.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/card_back.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/card_front.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'dart:math' as math;

class FlipCard extends HookConsumerWidget {
  const FlipCard({super.key, required this.word, required this.index});
  final Word word;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // プロバイダーからカードの状態を読み取る
    final isFront = ref.watch(flipCardProviderFamily(index));
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );

    final angle = useAnimation(
      Tween<double>(begin: 0, end: math.pi).animate(animationController),
    );

    void flipCard() {
      if (!isFront) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
      ref.read(flipCardProviderFamily(index).notifier).state = !isFront;
    }

    return GestureDetector(
      onTap: flipCard,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          // Y軸を中心に回転
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001) // 3D効果を追加
            ..rotateX(angle);

          // 90度以上回転したら内容を切り替える
          final isUnderHalfWay = angle < math.pi / 2;
          if (!isUnderHalfWay) {
            transform.rotateX(math.pi);
          }

          return Transform(
            alignment: Alignment.center,
            transform: transform,
            child: isUnderHalfWay
                ? CardFront(word: word) // 表面のウィジェット
                : CardBack(word: word), // 裏面のウィジェット
          );
        },
      ),
    );
  }
}
