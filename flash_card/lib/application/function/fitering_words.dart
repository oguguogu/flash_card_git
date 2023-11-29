import 'package:flash_card/presentation/provider/provider_common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void filteringWords(WidgetRef ref, int filteredNum) {
  int currentFilter = ref.read(filteredNumProvider);

  // 同じフィルター番号が選択された場合、フィルタリングを解除
  if (currentFilter == filteredNum) {
    ref.read(filteredNumProvider.notifier).state = 0;
    debugPrint("filteringWords: $filteredNum");
  } else {
    // 異なるフィルター番号が選択された場合、新しい番号でフィルタリング
    ref.read(filteredNumProvider.notifier).state = filteredNum;
    debugPrint("filteringWords: $filteredNum");
  }
}
