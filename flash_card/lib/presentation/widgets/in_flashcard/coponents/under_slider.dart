import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';

class UnderSlider extends ConsumerWidget {
  const UnderSlider({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderValue = ref.watch(sliderValueProvider);
    final carouselController = ref.watch(jumpCarouselControllerProvider);

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        inactiveTrackColor: const Color.fromARGB(255, 189, 189, 189),
        thumbColor: Colors.white,
        overlayColor: Colors.white.withOpacity(0),
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
        valueIndicatorTextStyle: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
      ),
      child: Slider(
        value: sliderValue,
        label: ref.watch(itemsListProvider).length > 2
            ? (sliderValue).toInt().toString()
            : (sliderValue - 1).toInt().toString(),
        onChanged: (value) {
          if (value >= 0) {
            ref.read(sliderValueProvider.notifier).state = value;
            carouselController.animateToPage(value.toInt() + 1);
          }
        },
        min: -1,
        max: ref.watch(itemsListProvider).length > 2
            ? (ref.watch(itemsListProvider).length).toDouble() - 2
            : 1.0,
        divisions: ref.watch(itemsListProvider).length > 2
            ? ref.watch(itemsListProvider).length - 1
            : 1,
      ),
    );
  }
}
