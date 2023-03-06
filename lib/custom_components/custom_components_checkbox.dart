
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class CustomComponentCheckBox extends StatelessWidget {
  const CustomComponentCheckBox({Key? key}) : super(key: key);

  static const String route = "CustomComponentCheckBox";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自绘组件：CustomCheckBox"),
      ),
      body: TextButton(onPressed: () {
        Navigator.of(context).pushNamed(CustomChexboxSample.route);
      }, child:  SizedBox(
        height: 80,
        child: textcontainer("示例"),
      ),)
    );
  }
}

class RenderCustomCheckBox extends RenderBox with RenderObjectAnimationMixin {
  bool value;
  int pointerId = -1;
  double strokeWidth;
  Color strokeColor;
  Color fillColor;
  double radius;
  ValueChanged<bool>? onChanged;

  RenderCustomCheckBox(this.strokeWidth, this.strokeColor, this.fillColor, this.value, this.radius, this.onChanged) {
    progress = value ? 1: 0;
  }

  bool get isRepainBoundary => true;

  //背景动画时长占比（背景动画要在前40%的时间内执行完毕，之后执行打勾动画）
  final double bgAnimationInterval = .4;

  @override
  void doPaint(PaintingContext context, Offset offset) {
    Rect rect = offset & size;
    _drawBackground(context, rect);
    _drawCheckMark(context, rect);
  }

  void _drawBackground(PaintingContext context, Rect rect) {
    Color color = value ? fillColor : Colors.grey;
    var paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill
      ..color = color;

    // 我们对矩形做插值
    final outer = RRect.fromRectXY(rect, radius, radius);
    var rects = [
      rect.inflate(-strokeWidth),
      Rect.fromCenter(center: rect.center, width: 0, height: 0)
    ];
    var rectProgress = Rect.lerp(rects[0], rects[1], min(progress, bgAnimationInterval) / bgAnimationInterval)!;

    final inner = RRect.fromRectXY(rectProgress, 0, 0);
    //画背景
    context.canvas.drawDRRect(outer, inner, paint);
  }

  //画✅
  void _drawCheckMark(PaintingContext context, Rect rect) {
    //在画好背景后再画前景
    if(progress > bgAnimationInterval) {

      //确定中间拐点位置
      final secondOffset = Offset(rect.left + rect.width / 2.5, rect.bottom - rect.height / 4);

      //第三个点的位置
      final lastOffset = Offset(rect.right - rect.width / 6, rect.top + rect.height / 4);

      final _lastOffset = Offset.lerp(secondOffset, lastOffset, (progress - bgAnimationInterval) / (1 - bgAnimationInterval))!;

      //将三个点连起来
      final path = Path()
        ..moveTo(rect.left + rect.width / 7, rect.top + rect.height / 2)
        ..lineTo(secondOffset.dx, secondOffset.dy)
        ..lineTo(_lastOffset.dx, _lastOffset.dy);


      final paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.stroke
        ..color = strokeColor
        ..strokeWidth = strokeWidth;

      context.canvas.drawPath(path, paint);
    }
  }

  @override
  void performLayout() {
    size = constraints.constrain(
        constraints.isTight ? Size.infinite : const Size(25, 25)
    );
  }

  // 必须置为true，否则不可以响应事件
  @override
  bool hitTestSelf(Offset position) {
    return true;
  }

  // 只有通过点击测试的组件才会调用本方法
  @override
  void handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) {
    if(event.down) {
      pointerId = event.pointer;
    } else if(pointerId == event.pointer) {
      // 判断手指抬起时是在组件范围内的话才触发onChange
      if(size.contains(event.localPosition)) {
        onChanged?.call(!value);
      }
    }
  }
}

class CustomCheckbox extends LeafRenderObjectWidget {

  const CustomCheckbox({
    Key? key,
    this.strokeWidth = 2.0,
    this.strokeColor = Colors.white,
    this.fillColor = Colors.blue,
    this.value = false,
    this.radius = 2.0,
    this.onChanged,
  }) : super(key: key);

  final double strokeWidth; //✅的线条宽度
  final Color strokeColor;  // ✅的线条颜色
  final Color? fillColor; // 填充颜色
  final bool value; //选中状态
  final double radius; //圆角
  final ValueChanged<bool>? onChanged;  //选中状态发生改变后回调

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomCheckBox(strokeWidth, strokeColor, fillColor ?? Theme.of(context).primaryColor, value, radius, onChanged);
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderCustomCheckBox renderObject) {
    if(renderObject.value != value) {
      renderObject.animationStatus = value ? AnimationStatus.forward : AnimationStatus.reverse;
    }
    renderObject
      ..strokeWidth = strokeWidth
      ..strokeColor = strokeColor
      ..fillColor = fillColor ?? Theme.of(context).primaryColor
      ..radius = radius
      ..value = value
      ..onChanged = onChanged;
  }
}

mixin RenderObjectAnimationMixin on RenderObject{
  double _progress = 0;
  int? _lastTimeStamp;

  // 动画时长，子类可以重写
  Duration get duration => const Duration(milliseconds: 200);
  AnimationStatus _animationStatus = AnimationStatus.completed;

  // 设置动画状态
  set animationStatus(AnimationStatus v) {
    if(_animationStatus != v) {
      markNeedsPaint();
    }
    _animationStatus = v;
  }

  double get progress => _progress;
  set progress(double v) {
    _progress = v.clamp(0, 1);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    doPaint(context, offset); // 调用子类绘制逻辑
    _scheduleAnimation();
  }


  void _scheduleAnimation() {
    if(_animationStatus != AnimationStatus.completed) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        if(_lastTimeStamp != null) {
          double delta = (timeStamp.inMilliseconds - _lastTimeStamp!) /
              duration.inMilliseconds;
          if(delta == 0) {
            markNeedsPaint();
            return;
          }

          if(_animationStatus == AnimationStatus.reverse) {
            delta = -delta;
          }

          _progress = _progress +delta;
          if(_progress >= 1 || _progress <= 0) {
            _animationStatus = AnimationStatus.completed;
            _progress = _progress.clamp(0, 1);
          }
        }

        markNeedsPaint();
        _lastTimeStamp = timeStamp.inMilliseconds;
      });
    } else {
      _lastTimeStamp = null;
    }
  }

  // 子类实现绘制逻辑的地方
  void doPaint(PaintingContext context, Offset offset);
}

class CustomChexboxSample extends StatefulWidget {
  static const String route = "CustomChexboxSample";

  const CustomChexboxSample({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CustomChexboxSampleState();
  }
}

class _CustomChexboxSampleState extends State<CustomChexboxSample> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自定义checkbox sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCheckbox(
              value: _checked,
              onChanged: _onChange,
            ),
            Padding(padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 16,
              height: 16,
              child: CustomCheckbox(
                strokeWidth: 1,
                radius: 1,
                value: _checked,
                onChanged: _onChange,
              ),
            ),),
            SizedBox(
              width: 30,
              height: 30,
              child: CustomCheckbox(
                strokeWidth: 3,
                radius: 3,
                value: _checked,
                onChanged: _onChange,
              ),
            )
          ],
        ),
      ),
    );
  }
  void _onChange(value) {
    setState(() => _checked = value);
  }
}
