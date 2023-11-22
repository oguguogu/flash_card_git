import 'package:flutter/material.dart';

class HorizonButtonsDialog extends StatelessWidget {
  const HorizonButtonsDialog(
    this.title,
    this.content,
    this.rightButtonText,
    this.leftButtonText,
    this.rightButtonOnPressed,
    this.leftButtonOnPressed, {
    super.key,
  });
  final String? title;
  final String content;
  final String rightButtonText;
  final String leftButtonText;
  final VoidCallback? rightButtonOnPressed;
  final VoidCallback? leftButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 30.0, 24.0, 10.0),
      title: Text(title!),
      content: Text(
        content,
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        const Divider(
          color: Color.fromARGB(115, 194, 194, 194),
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                rightButtonOnPressed!();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(leftButtonText),
            ),
            const SizedBox(
              height: 40, // 適宜調整
              child: VerticalDivider(
                width: 1,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Color.fromARGB(115, 194, 194, 194),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
                leftButtonOnPressed!();
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(rightButtonText,
                  style: const TextStyle(color: Colors.red)),
            ),
          ],
        ),
      ],
    );
  }
}
