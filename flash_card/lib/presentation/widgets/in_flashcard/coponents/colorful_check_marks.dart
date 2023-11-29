import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_common.dart';
import 'package:flash_card/presentation/provider/provider_flash.dart';
import 'package:flash_card/domain/models/word.dart';

final memorizedTypeProvider = StateProvider<MemorizedType?>((ref) => null);

enum MemorizedType { red, yellow, blue }

class StickyMark extends StatelessWidget {
  final MemorizedType type;
  final bool isSelected;
  final VoidCallback onTap; // タップイベントのためのコールバック

  const StickyMark({
    Key? key,
    required this.type,
    required this.isSelected,
    required this.onTap, // コンストラクタに追加
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (type) {
      case MemorizedType.red:
        color = Colors.red.shade600;
        break;
      case MemorizedType.yellow:
        color = Colors.yellow.shade600;
        break;
      case MemorizedType.blue:
        color = Colors.blue.shade600;
        break;
    }

    return InkWell(
      onTap: onTap, // タップイベントのハンドラを設定
      child: Container(
        width: 18,
        height: 36,
        decoration: BoxDecoration(
          color: isSelected ? color : Colors.transparent,
          border: Border.all(color: color, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

class ColorfulCheckMarks extends ConsumerWidget {
  const ColorfulCheckMarks(
      {Key? key, required this.selectedType, required this.idKey})
      : super(key: key);

  final MemorizedType? selectedType;
  final int idKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final database = ref.watch(myCardDatabaseProvider);
    int databaseTypeValue = 0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: MemorizedType.values.map((type) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: StickyMark(
            type: type,
            isSelected: selectedType == type,
            onTap: () async {
              final currentType = ref.read(memorizedTypeProviderFamily(idKey));

              //データベースを更新
              if (currentType == type) {
                ref.read(memorizedTypeProviderFamily(idKey).notifier).state =
                    null;
                debugPrint('null');
                await database.updateDatabaseCard(idKey, 0);
                databaseTypeValue = 0;
              } else {
                ref.read(memorizedTypeProviderFamily(idKey).notifier).state =
                    type;
                if (type == MemorizedType.red) {
                  await database.updateDatabaseCard(idKey, 1);
                  debugPrint('red');
                  databaseTypeValue = 1;
                } else if (type == MemorizedType.yellow) {
                  await database.updateDatabaseCard(idKey, 2);
                  debugPrint('yellow');
                  databaseTypeValue = 2;
                } else if (type == MemorizedType.blue) {
                  await database.updateDatabaseCard(idKey, 3);
                  debugPrint('blue');
                  databaseTypeValue = 3;
                }
              }

              //現存するWordListを更新
              List<Word> wordList = ref.read(wordListsProvider);
              int index = wordList.indexWhere((word) => word.id == idKey);
              if (index != -1) {
                Word oldWord = wordList[index];
                Word newWord = Word(
                  id: oldWord.id,
                  word: oldWord.word,
                  meaning: oldWord.meaning,
                  partOfSpeech: oldWord.partOfSpeech,
                  pronunciation: oldWord.pronunciation,
                  level: oldWord.level,
                  collocation: oldWord.collocation,
                  example: oldWord.example,
                  derivatives: oldWord.derivatives,
                  origin: oldWord.origin,
                  memorizedType: databaseTypeValue,
                );

                // リストを更新
                List<Word> updatedWordList = List<Word>.from(wordList)
                  ..removeAt(index)
                  ..insert(index, newWord);

                ref.read(wordListsProvider.notifier).state = updatedWordList;
              }
            },
          ),
        );
      }).toList(),
    );
  }
}
