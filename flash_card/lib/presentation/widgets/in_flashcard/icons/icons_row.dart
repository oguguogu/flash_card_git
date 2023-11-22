import 'package:flash_card/application/function/fitering_words.dart';
import 'package:flash_card/presentation/provider/provider_in_common.dart';
import 'package:flash_card/presentation/provider/provider_in_flash.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/icons/base_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconsRow extends ConsumerWidget {
  const IconsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carouselController = ref.watch(jumpCarouselControllerProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BaseIcon(
            text: '知らん',
            picture: 'assets/images/red_flashcard_icon.png',
            onTap: () {
              filteringWords(ref, 1);
              debugPrint(ref.watch(filteredNumProvider).toString());
              carouselController.animateToPage(1);
              ref.watch(sliderValueProvider.notifier).state = 0;
            }),
        BaseIcon(
            text: 'ぎり覚えた',
            picture: 'assets/images/yellow_flashcard_icon.png',
            onTap: () {
              filteringWords(ref, 2);
              carouselController.animateToPage(1);
              ref.watch(sliderValueProvider.notifier).state = 0;
              debugPrint(ref.watch(filteredNumProvider).toString());
            }),
        BaseIcon(
            text: '完璧',
            picture: 'assets/images/blue_flashcard_icon.png',
            onTap: () {
              filteringWords(ref, 3);
              carouselController.animateToPage(1);
              ref.watch(sliderValueProvider.notifier).state = 0;
            }),
      ],
    );
  }
}
