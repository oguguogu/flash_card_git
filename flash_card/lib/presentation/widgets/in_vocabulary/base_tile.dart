import 'package:flutter/material.dart';

class BaseTile extends StatelessWidget {
  const BaseTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return CustomPaint(
      size: Size(screenWidth, 100), // キャンバスのサイズを調整
      painter: BarChartPainter(),
    );
  }
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 枠線のペイント設定
    var borderPaint = Paint()
      ..color = const Color.fromARGB(175, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // 枠線の太さを調整

    // 青い枠線のペイント設定
    var blueBorderPaint = Paint()
      ..color = const Color.fromARGB(80, 33, 149, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // 青い枠線の太さも調整

    // 青のバーを描画
    var blueBarRect = Rect.fromLTWH(0, 0, size.width / 3, size.height);
    canvas.drawRect(
        blueBarRect, Paint()..color = const Color.fromARGB(90, 33, 149, 243));

    // 灰色のバーを描画
    var greyBarRect =
        Rect.fromLTWH(size.width / 3, 0, (size.width * 2) / 3, size.height);
    canvas.drawRect(
        greyBarRect, Paint()..color = const Color.fromARGB(90, 158, 158, 158));

    // 青のバーの上部と下部の枠線を描画
    canvas.drawLine(Offset(0, 0), Offset(blueBarRect.width, 0), borderPaint);
    canvas.drawLine(Offset(0, size.height),
        Offset(blueBarRect.width, size.height), borderPaint);

    // 灰色のバーの上部と下部の枠線を描画
    canvas.drawLine(
        Offset(greyBarRect.left, 0), Offset(greyBarRect.right, 0), borderPaint);
    canvas.drawLine(Offset(greyBarRect.left, size.height),
        Offset(greyBarRect.right, size.height), borderPaint);

    // 灰色のバーの左側に青い枠線を描画
    canvas.drawLine(Offset(greyBarRect.left, 0),
        Offset(greyBarRect.left, size.height), blueBorderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
