import 'package:carousel_slider/carousel_slider.dart';
import 'package:flash_card/presentation/widgets/common/form/send_word_form.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/coponents/under_slider.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/icons/icons_row.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FlashCards extends HookConsumerWidget {
  const FlashCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsList = ref.watch(itemsListProvider);
    final carouselController = ref.watch(jumpCarouselControllerProvider);
    final sliderValue = ref.watch(sliderValueProvider).toInt();
    final wordList = ref.watch(wordListsProvider);
    final currentPage = useState(2);
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 40),
          const IconsRow(),
          const SizedBox(height: 60),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.6), // ここで左側のパディングを調整
            child: Text(
              "$sliderValue/ ${wordList.length}",
              style: const TextStyle(
                fontSize: 16.0, // フォントサイズ
                fontWeight: FontWeight.bold, // フォントの太さ
                color: Colors.grey, // フォントの色
                letterSpacing: 1.2, // 文字間のスペース
              ),
            ),
          ),
          CarouselSlider(
            carouselController: carouselController,
            items: itemsList,
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              initialPage: 2,
              onPageChanged: (index, reason) {
                // ユーザー操作の場合にのみ制御を適用
                if (reason == CarouselPageChangedReason.manual) {
                  if (index == 0) {
                    // 手動で0ページ目に移動しようとした場合、前のページ（ここでは1）に戻る
                    carouselController.animateToPage(1);
                    ref.read(sliderValueProvider.notifier).state =
                        index.toDouble();
                  } else {
                    // それ以外の場合は正常にページを更新
                    currentPage.value = index;
                    ref.read(sliderValueProvider.notifier).state =
                        index.toDouble() - 1;
                  }
                }
              },
            ),
          ),
          const SizedBox(height: 15),
          const UnderSlider(),
          const SizedBox(height: 10),
          SendWordForm(
            carouselController: carouselController,
          ),
        ],
      ),
    );
  }
}
