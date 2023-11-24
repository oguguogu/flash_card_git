import 'package:flash_card/application/function/convert_into_memorized_type.dart';
import 'package:flash_card/domain/models/dummy_words.dart';
import 'package:flash_card/domain/models/word.dart';
import 'package:flash_card/infrastructure/database/database_books.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/coponents/colorful_check_marks.dart';
import 'package:flash_card/presentation/widgets/main_widgets/sentence.dart';
import 'package:flash_card/presentation/widgets/main_widgets/vocabulary_book.dart';
import 'package:flash_card/presentation/widgets/common/bottom_nav_bar/my_bottom_nav_bar.dart';
import 'package:flash_card/presentation/widgets/main_widgets/flash_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_in_flash.dart';
import 'package:flash_card/presentation/provider/provider_in_common.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    Widget body;
    switch (currentIndex) {
      case 0:
        body = const FlashCards();
        break;
      case 1:
        body = const VocabularyBook();
        break;
      case 2:
        body = const Sentence();
        break;
      default:
        body = const FlashCards();
        break;
    }

    return Scaffold(
      body: FutureBuilder<List<DatabaseBook>>(
          future: MyBookDatabase().allDatabaseCardEntries,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                List<Word> words = dummyWords;
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(wordListsProvider.notifier).state = words;
                });
              } else {
                List<Word> words = [];
                List<MemorizedType?> memorizedTypes = [];
                for (int i = 0; i < snapshot.data!.length; i++) {
                  final data = snapshot.data![i];
                  final word = Word(
                      id: data.id,
                      word: data.word,
                      meaning: data.meaning,
                      partOfSpeech: data.partOfSpeech,
                      pronunciation: data.pronunciation,
                      level: data.level,
                      collocation: data.collocation,
                      example: data.example,
                      derivatives: data.derivatives,
                      origin: data.origin,
                      memorizedType: data.memorizedType);
                  words.insert(0, word);
                  memorizedTypes.insert(
                      0, convertIntToMemorizedType(data.memorizedType));
                }
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(wordListsProvider.notifier).state = words;
                  for (int i = 0; i < words.length; i++) {
                    ref
                        .read(memorizedTypeProviderFamily(words[i].id).notifier)
                        .state = memorizedTypes[i];
                  }
                });
              }
              return body;
            } else {
              return body;
            }
          }),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}
