import 'package:flash_card/presentation/provider/provider_in_flash.dart';
import 'package:flash_card/presentation/widgets/in_vocabulary/tile_expansion_stacking.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_flip/page_flip.dart';
import 'package:flash_card/domain/models/word.dart';

class VocabularyBook extends HookConsumerWidget {
  const VocabularyBook({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wordList = ref.watch(wordListsProvider).reversed.toList();

    // 単語リストを7つごとに分割
    final pages = <Widget>[];
    for (int i = 0; i < wordList.length; i += 6) {
      int end = (i + 6 < wordList.length) ? i + 6 : wordList.length;
      var subList = wordList.sublist(i, end);
      pages.add(_buildPage(context, subList, i + 1)); // インデックス + 1 から ID を開始
    }

    return PageFlipWidget(
      backgroundColor: Colors.white,
      children: pages,
    );
  }

  Widget _buildPage(BuildContext context, List<Word> subList, int startIndex) {
    return SingleChildScrollView(
      child: Column(
        children: subList.asMap().entries.map((entry) {
          int id = startIndex + entry.key; // startIndex から ID を計算
          Word word = entry.value;
          return TileExpansionStacking(
            id: id,
            word: word.word,
            meaning: word.meaning,
            partOfSpeech: word.partOfSpeech,
            pronunciation: word.pronunciation,
            level: word.level,
            origin: word.origin,
            collocation: word.collocation,
            derivatives: word.derivatives,
            example: word.example,
          );
        }).toList(),
      ),
    );
  }
}











// class VocabularyBook extends ConsumerWidget {
//   const VocabularyBook({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final wordList = ref.watch(wordListsProvider);

//     return Column(
//       children: [
//         Text('単語帳', style: Theme.of(context).textTheme.headline4),
//         const SizedBox(height: 40.0),
//         Expanded(
//           child: SingleChildScrollView(
//               child: Column(
//             children: wordList.reversed.toList().asMap().entries.map((entry) {
//               final word = entry.value;
//               final id = entry.key + 1; // インデックスに1を加えてidを設定
//               return TileExpansionStacking(
//                 id: id,
//                 word: word.word,
//                 meaning: word.meaning,
//                 pronunciation: word.pronunciation,
//                 level: word.level,
//                 origin: word.origin,
//                 collocation: word.collocation,
//                 example: word.example,
//               );
//             }).toList(),
//           )),
//         ),
//         const SizedBox(height: 60.0),
//         const Padding(
//             padding: EdgeInsets.only(right: 250),
//             child: Text(
//               "test",
//             )),
//       ],
//     );
//   }
// }
