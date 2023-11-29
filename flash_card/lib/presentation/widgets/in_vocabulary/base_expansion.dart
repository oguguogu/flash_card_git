import 'package:flutter/material.dart';

class BaseExpansion extends StatelessWidget {
  const BaseExpansion(
      {super.key,
      required this.word,
      required this.collocation,
      required this.example});

  final String word;
  final String collocation;
  final String example;

  @override
  Widget build(BuildContext context) {
    final collocations = collocation.split(RegExp(',|、')).join('\n');
    final examples = example.split('.').join('.\n');

    List<TextSpan> spans = [];
    collocations.split(' ').forEach((String text) {
      spans.add(
        TextSpan(
          text: '$text ', // ここで文字列補間を使用
          style: TextStyle(color: text == word ? Colors.red : Colors.black),
        ),
      );
    });

    return SizedBox(
      width: double.maxFinite,
      child: ExpansionTile(
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        collapsedBackgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(width: 300, height: 74, child: Text("")),
        ), // 既存のBaseTileウィジェットをタイトルとして使用
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: spans,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(examples),
          ),
        ],
      ),
    );
  }
}
