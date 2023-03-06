
import 'package:flutter/material.dart';

class CustomDecoration extends Decoration {

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomBoxPainter(this);
  }
}

class _CustomBoxPainter extends BoxPainter {
  final Paint painter;
  final CustomDecoration testDecoration;

  _CustomBoxPainter(this.testDecoration)
      : painter = Paint()
    ..color = Colors.red
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    var size = configuration.size;
    Offset leftTop = offset;
    Offset rightTop = leftTop.translate(size!.width, 0);
    Offset leftBottom = leftTop.translate(0, size.height);
    Offset rightBottom = leftTop.translate(size.width, size.height);

    canvas.drawLine(leftTop, rightTop, painter);
    canvas.drawLine(leftTop, leftBottom, painter);
    canvas.drawLine(rightTop, rightBottom, painter);
    canvas.drawLine(leftBottom, rightBottom, painter);

    var textPainter = TextPainter(
      text: const TextSpan(
        text: "测试",
        style: TextStyle(
          backgroundColor: Colors.green,
          color: Colors.red,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, (leftTop + rightBottom) / 2);
  }

}
