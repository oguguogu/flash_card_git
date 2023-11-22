import 'package:flutter/material.dart';

class BaseExpansion extends StatelessWidget {
  const BaseExpansion(
      {super.key, required this.collocation, required this.example});

  final String collocation;
  final String example;

  @override
  Widget build(BuildContext context) {
    final collocations = collocation.split(',').join('\n');
    final examples = example.split('.').join('.\n');
    return SizedBox(
      width: double.maxFinite,
      child: ExpansionTile(
        // tilePadding: EdgeInsets.only(right: 60),
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        collapsedBackgroundColor: const Color.fromARGB(0, 0, 0, 0),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(width: 300, height: 34, child: Text("")),
        ), // 既存のBaseTileウィジェットをタイトルとして使用
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(collocations),
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
