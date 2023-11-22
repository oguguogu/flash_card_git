import 'package:flash_card/domain/models/word.dart';

final dummyWords = [
  const Word(
    word: 'start',
    meaning: "始まる\n 出発する\n 開始する",
    pronunciation: "stɑːrt",
    level: "レベル1",
    collocation:
        " start + work（仕事を始める）, start + journey（旅行を始める）, start + conversation（会話を始める）",
    example:
        "Her vivacious spirit made her the life of the party. 彼女の生き生きとした精神は、パーティーの中心となった。",
    origin: "語源はラテン語のvivax（活発な、長生きの）です。",
    memorizedType: 0,
  ),
  const Word(
    word: 'memorizing',
    meaning: "記憶する\n 暗記する",
    pronunciation: "ˌriːkənˈstrʌkt",
    level: "レベル6",
    collocation:
        "reconstruct + history（歴史を再建する）, reconstruct + building（建物を再建する）",
    example:
        "After the earthquake, the community worked together to reconstruct the town. 地震の後、コミュニティは町を再建するために協力した。",
    origin: "語源はre(再び) + construct(建設する)です。",
    memorizedType: 0,
  ),
];
