import 'package:flutter/material.dart';
import 'package:flash_card/presentation/widgets/in_vocabulary/base_tile.dart ';
import 'package:flash_card/presentation/widgets/in_vocabulary/base_expansion.dart';

class TileExpansionStacking extends StatelessWidget {
  const TileExpansionStacking(
      {super.key,
      required this.id,
      required this.word,
      required this.partOfSpeech,
      required this.meaning,
      required this.pronunciation,
      required this.level,
      required this.origin,
      required this.collocation,
      required this.derivatives,
      required this.example});
  final int id;
  final String word;
  final String partOfSpeech;
  final String meaning;
  final String pronunciation;
  final String level;
  final String origin;
  final String collocation;
  final String? derivatives;
  final String example;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        const BaseTile(),
        BaseExpansion(collocation: collocation, example: example),
        Positioned(
            left: screenWidth * 0.01,
            top: 1,
            child: Text(id.toString(), style: const TextStyle(fontSize: 8))),
        Positioned(
          left: screenWidth * 0.24,
          top: 1,
          child: Text(
            level,
            style: const TextStyle(fontSize: 8),
          ),
        ),
        Positioned(
          left: screenWidth * 0.01,
          top: 6,
          child: Text(word,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Positioned(
          left: screenWidth * 0.01,
          top: 25,
          child: Text("[$pronunciation]", style: const TextStyle(fontSize: 8)),
        ),
        Positioned(
          left: screenWidth * 0.35,
          top: 6,
          child: Text(
            meaning,
            style: const TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          right: screenWidth * 0.01,
          top: 45,
          child: Text(origin == " 語源は不明です。" ? "" : origin,
              style: const TextStyle(fontSize: 8)),
        ),
      ],
    );
  }
}
