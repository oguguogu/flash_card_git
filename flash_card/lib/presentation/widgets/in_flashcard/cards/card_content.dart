import 'package:flash_card/presentation/widgets/common/alert_dialog/horizon_buttons_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/presentation/theme/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_in_common.dart';
import 'package:flash_card/presentation/provider/provider_in_flash.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/coponents/colorful_check_marks.dart';
import 'package:flash_card/presentation/widgets/common/button/tts_icon_button.dart';

class CardContent extends ConsumerWidget {
  const CardContent(this.ttsButton,
      {Key? key, required this.text, required this.collocationKey})
      : super(key: key);
  final String text;
  final String collocationKey;
  final TtsIconButton? ttsButton;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final memorizedType =
        ref.watch(memorizedTypeProviderFamily(collocationKey));
    final deleteDBCard = ref.watch(deleteCardProvider);
    final carouselController = ref.watch(jumpCarouselControllerProvider);
    final sliderValue = ref.watch(sliderValueProvider);

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: <Widget>[
        Card(
          color: const Color.fromARGB(255, 189, 189, 189),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: ttsButton != null
                ? const EdgeInsets.fromLTRB(0, 16, 16, 16)
                : const EdgeInsets.all(16),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (ttsButton != null) ttsButton!,
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: RawSize.p28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 6,
          top: 2,
          child: ColorfulCheckMarks(
              selectedType: memorizedType, collocationKey: collocationKey),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: InkWell(
            onTap: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (BuildContext context) {
                  return HorizonButtonsDialog(
                      '', '$textを削除しますか？', '削除する', 'キャンセル', () {}, () {});
                },
              );
              if (confirm == true) {
                ref.read(sliderValueProvider.notifier).state -= 1;
                carouselController.animateToPage(sliderValue.toInt());
                ref.read(wordListsProvider.notifier).update((state) {
                  return state
                      .where(
                          (item) => item.word != text && item.meaning != text)
                      .toList();
                  // (item) => item.collocation != collocationKey).toList();
                });
                deleteDBCard(text);
                debugPrint('delete $text');
              }
            },
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
