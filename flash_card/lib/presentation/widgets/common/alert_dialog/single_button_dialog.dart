import 'package:flutter/material.dart';

class SingleButtonDialog extends StatelessWidget {
  const SingleButtonDialog(
      {super.key,
      required this.ctx,
      required this.title,
      required this.content,
      required this.buttonText});
  final BuildContext ctx;
  final String title;
  final String content;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        const Divider(
          color: Color.fromARGB(115, 194, 194, 194),
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: const EdgeInsets.all(5), // 10ピクセルのパディングを追加
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size(215, 5),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Text(
                  buttonText,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
