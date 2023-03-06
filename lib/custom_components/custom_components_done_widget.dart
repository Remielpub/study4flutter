
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_components/custom_components_checkbox.dart';

import '../utils/widget_util.dart';

class CustomComponentsDoneWidget extends StatelessWidget {
  const CustomComponentsDoneWidget({Key? key}) : super(key: key);

  static const String route = "CustomComponentsDoneWidget";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自绘组件: DoneWidget"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.yellow,
        child: Column(
          children: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).pushNamed(DoneWidgetSample.route);
            }, child: textcontainer("示例")),
          ],
        ),
      ),
    );
  }
}

class RenderDoneObject extends RenderBox with RenderObjectAnimationMixin {

  double strokeWidth;
  Color color;
  bool outLine;

  ValueChanged<bool>? onChanged;

  RenderDoneObject(this.strokeWidth, this.color, this.outLine);

  @override
  Duration get duration => const Duration(milliseconds: 300);

  @override
  void doPaint(PaintingContext context, Offset offset) {
    Curve curve = Curves.easeIn;
    final _progress = curve.transform(progress);

    Rect rect = offset & size;
    final paint = Paint()
      ..isAntiAlias = true
      ..style = outLine ? PaintingStyle.stroke : PaintingStyle.fill
      ..color = color;

    if(outLine) {
      paint.strokeWidth = strokeWidth;
      rect = rect.deflate(strokeWidth / 2);
    }

    //画背景图
    context.canvas.drawCircle(rect.center, rect.shortestSide, paint);

    paint
      ..style = PaintingStyle.stroke
      ..color = outLine ? color : Colors.white
      ..strokeWidth = strokeWidth;

    final path = Path();

    Offset firstOffset = Offset(rect.left + rect.width / 6, rect.top + rect.height / 2.1);

    final secondOffset = Offset(rect.left + rect.width / 2.5, rect.bottom - rect.height / 3.3);

    path.moveTo(firstOffset.dx, firstOffset.dy);

    const adjustProgress = .6;

    //画 "勾"
    if(_progress < adjustProgress) {
      //第一个点到第二个点的连线做动画(第二个点不停的变)
      Offset _secondOffset = Offset.lerp(firstOffset, secondOffset, _progress / adjustProgress)!;
      path.lineTo(_secondOffset.dx, _secondOffset.dy);
    } else {
      //链接第一个点和第二个点
      path.lineTo(secondOffset.dx, secondOffset.dy);
      //第三个点位置随着动画变，做动画
      final lastOffset = Offset(rect.right - rect.width / 5, rect.top + rect.height / 3.5);

      Offset _lastOffset = Offset.lerp(secondOffset, lastOffset, (progress - adjustProgress) / (1 - adjustProgress),)!;
      path.lineTo(_lastOffset.dx, _lastOffset.dy);
    }
    context.canvas.drawPath(path, paint..style = PaintingStyle.stroke);
  }

  @override
  void performLayout() {
    size = constraints.constrain(
      constraints.isTight ? Size.infinite : const Size(25, 25)
    );
  }
}

class DoneWidget extends LeafRenderObjectWidget {
  const DoneWidget({
    Key? key,
    this.strokeWidth = 2.0,
    this.color = Colors.green,
    this.outLine = false,
  }) : super(key: key);

  //线条宽度
  final double strokeWidth;
  //轮廓颜色或填充色
  final Color color;
  //如果为true，则没有填充色，color代表轮廓的颜色；如果为false，则color为填充色
  final bool outLine;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderDoneObject(strokeWidth, color, outLine)..animationStatus = AnimationStatus.forward; // 创建时执行正向动画
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderDoneObject renderObject) {
    renderObject
      ..strokeWidth = strokeWidth
      ..outLine = outLine
      ..color = color;
  }
}

class DoneWidgetSample extends StatefulWidget {
  const DoneWidgetSample({Key? key}) : super(key: key);

  static const String route = "DoneWidgetSample";
  @override
  State<StatefulWidget> createState() => _DoneWidgetSampleState();

}

class _DoneWidgetSampleState extends State<DoneWidgetSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DoneWidget Sample"),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        child: const DoneWidget(),
      ),
    );
  }

}
