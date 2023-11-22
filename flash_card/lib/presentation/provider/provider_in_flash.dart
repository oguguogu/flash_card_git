import 'package:flutter/material.dart';
import 'package:flash_card/domain/models/dummy_words.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash_card/presentation/provider/provider_in_common.dart';
import 'package:flash_card/domain/models/word.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/flip_card.dart';
import 'package:flash_card/presentation/widgets/in_flashcard/cards/new_input.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flash_card/infrastructure/database/database_cards.dart';

final myCardDatabaseProvider = Provider<MyCardDatabase>((ref) {
  return MyCardDatabase();
});

//carouselのcontrollerをファイルを超えて扱うためにproviderを使う
final jumpCarouselControllerProvider =
    Provider<CarouselController>((ref) => CarouselController());

//打った文字をリアルタイムで反映させるためにproviderを使う
final inputWordProvider = StateProvider<String>((ref) => "");

//GPTからのレスポンスを受け取るためにproviderを使う
final responseProvider = StateProvider<String?>((ref) => null);

//GPTのレスポンスを待つためにproviderを使う。
final waitingGptProvider = StateProvider<bool>((ref) => false);

final showMemorizedTypeProvider = StateProvider<bool>((ref) => false);

final itemsListProvider = StateProvider<List<Widget>>((ref) {
  // 現在のフィルタリング状態を取得
  final filteredNum = ref.watch(filteredNumProvider);
  final filteredWords = switch (filteredNum) {
    0 => ref.watch(wordListsProvider),
    1 => ref
        .watch(wordListsProvider)
        .where((word) => word.memorizedType == 1)
        .toList(),
    2 => ref
        .watch(wordListsProvider)
        .where((word) => word.memorizedType == 2)
        .toList(),
    3 => ref
        .watch(wordListsProvider)
        .where((word) => word.memorizedType == 3)
        .toList(),
    int() => ref.watch(wordListsProvider),
  };
  List<Widget> items = [const SizedBox(), const NewInput()];
  // フィルタリングされたリストを使用してウィジェットを生成
  items.addAll(List.generate(
    filteredWords.length,
    (index) => FlipCard(word: filteredWords[index], index: index),
  ));
  return items;
});

final inputTextControllerProvider =
    Provider<TextEditingController>((ref) => TextEditingController());

final wordListsProvider = StateProvider<List<Word>>((ref) => dummyWords);

//めくれるカードたちを管理するためにproviderを使う
final flipCardProviderFamily =
    StateProvider.family<bool, int>((ref, word) => false);

final sliderValueProvider = StateProvider<double>((ref) => 1.0);

final errorGptProvider = StateProvider<bool>((ref) => false);
