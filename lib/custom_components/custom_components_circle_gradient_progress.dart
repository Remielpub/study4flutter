import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_components/custom_components_sample_turnbox.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class CustomComponentsCircleGradientProgress extends StatelessWidget {
  const CustomComponentsCircleGradientProgress({Key? key}) : super(key: key);

  static const String route = "customcomponentscirclegradientprogress";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自绘实例：圆形背景渐变进度条"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("本节我们实现一个圆形背景渐变进度条，它支持："),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.支持多种背景渐变色。
2.任意弧度；进度条可以不是整圆。
3.可以自定义粗细、两端是否圆角等样式。"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(GradientCircularProgressRoute.route);
                        },
                        child: textcontainer("示例"),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  const GradientCircularProgressIndicator({
    Key? key,
    this.strokeWidth = 2.0,
    required this.radius,
    required this.colors,
    this.stops,
    this.value,
    this.strokeCapRound = false,
    this.backgroundColor = const Color(0xFFEEEEEE),
    this.totalAngle = 2 * pi,
  }) : super(key: key);

  ///粗细
  final double strokeWidth;

  ///圆的半径
  final double radius;

  ///两端是否为圆角
  final bool strokeCapRound;

  ///当前进度，取值范围 [0.0-1.0]
  final double? value;

  ///进度条背景色
  final Color backgroundColor;

  ///进度条的总弧度， 2*PI 为整圆， 小于2*PI则不是整圆
  final double totalAngle;

  ///渐变色数组
  final List<Color> colors;

  ///渐变色的终止点，对应colors属性
  final List<double>? stops;

  @override
  Widget build(BuildContext context) {
    double _offset = .0;
    // 如果两端为圆角，则需要对起始位置进行调整，否则圆角部分会偏离起始位置
    // 下面调整的角度的计算公式是通过数学几何知识得出，读者有兴趣可以研究一下为什么是这样
    if (strokeCapRound) {
      _offset = asin(strokeWidth / (radius * 2 - strokeWidth));
    }

    var _colors = colors;
    if (_colors == null) {
      Color color = Theme.of(context).colorScheme.secondary;
      _colors = [color, color];
    }
    return Transform.rotate(
      angle: -pi / 2.0 - _offset,
      child: CustomPaint(
        size: Size.fromRadius(radius),
        painter: _GradientCircularProgressPainter(
            colors: _colors,
            strokeWidth: strokeWidth,
            strokeCapRound: strokeCapRound,
            backgroundColor: backgroundColor,
            value: value,
            total: totalAngle,
            radius: radius),
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  const _GradientCircularProgressPainter(
      {this.strokeWidth = 10.0,
      this.strokeCapRound = false,
      this.backgroundColor = const Color(0xFFEEEEEE),
      this.radius,
      this.total = 2 * pi,
      required this.colors,
      this.stops,
      this.value});

  final double strokeWidth;
  final bool strokeCapRound;
  final double? value;
  final Color backgroundColor;
  final List<Color> colors;
  final double total;
  final double? radius;
  final List<double>? stops;

  @override
  void paint(Canvas canvas, Size size) {
    if (radius != null) {
      size = Size.fromRadius(radius!);
    }
    double _offset = strokeWidth / 2.0;
    double _value = value ?? .0;
    _value = _value.clamp(.0, 1.0) * total;
    double _start = .0;

    if (strokeCapRound) {
      _start = asin(strokeWidth / (size.width - strokeWidth));
    }

    Rect rect = Offset(_offset, _offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);

    var paint = Paint()
      ..strokeCap = strokeCapRound ? StrokeCap.round : StrokeCap.butt
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = strokeWidth;

    if (backgroundColor != Colors.transparent) {
      paint.color = backgroundColor;
      canvas.drawArc(rect, _start, total, false, paint);
    }

    if (_value > 0) {
      paint.shader = SweepGradient(
              colors: colors, startAngle: 0.0, endAngle: _value, stops: stops)
          .createShader(rect);
      canvas.drawArc(rect, _start, _value, false, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GradientCircularProgressRoute extends StatefulWidget {
  const GradientCircularProgressRoute({Key? key}) : super(key: key);

  static const String route = "GradientCircularProgressRoute";
  @override
  State<StatefulWidget> createState() {
    return _GradientCircularProgressRouteState();
  }
}

class _GradientCircularProgressRouteState extends State<GradientCircularProgressRoute> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    bool isForward = true;
    _animationController.addStatusListener((status) {
      if(status == AnimationStatus.forward) {
        isForward = true;
      } else if(status == AnimationStatus.reverse) {
        isForward = false;
      } else if(status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        if(isForward) {
          _animationController.reverse();
        } else {
          _animationController.forward();
        }
      }
    });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animationController,
            builder: (BuildContext context, Widget? child) {
              return Padding(padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 16,
                    children: [
                      GradientCircularProgressIndicator(
                        radius: 50,
                        colors: const [Colors.blue, Colors.blue],
                        strokeWidth: 3.0,
                        value: _animationController.value,
                      ),
                      GradientCircularProgressIndicator(
                        radius: 50,
                        colors: const [Colors.red, Colors.orange],
                        strokeWidth: 3.0,
                        value: _animationController.value,
                      ),
                      GradientCircularProgressIndicator(
                        radius: 50,
                        colors: const [Colors.red, Colors.orange],
                        strokeWidth: 5.0,
                        value: _animationController.value,
                      ),
                      GradientCircularProgressIndicator(
                        radius: 50,
                        colors: const [Colors.red, Colors.orange],
                        strokeWidth: 5.0,
                        value: CurvedAnimation(parent: _animationController, curve: Curves.decelerate).value,
                      ),
                        TurnBox(
                          turns: 1 / 8,
                          child: GradientCircularProgressIndicator(
                            colors: const [Colors.red, Colors.orange, Colors.red],
                            radius: 50,
                            strokeWidth: 5,
                            strokeCapRound: true,
                            backgroundColor: Colors.red.shade50,
                            totalAngle: 1.5 * pi,
                            value: CurvedAnimation(
                              parent: _animationController,
                              curve: Curves.ease,
                            ).value,
                          ),),
                        RotatedBox(quarterTurns: 1,
                          child: GradientCircularProgressIndicator(
                            colors: [Colors.blue.shade700, Colors.blue.shade200], radius: 50, strokeWidth: 3.0, strokeCapRound: true,
                            backgroundColor: Colors.transparent,
                            value: _animationController.value,
                          ),
                        ),
                        GradientCircularProgressIndicator(radius: 50, colors: [
                          Colors.red,
                          Colors.amber,
                          Colors.cyan,
                          Colors.green.shade200,
                          Colors.blue,
                          Colors.red
                        ],
                        strokeWidth: 5.0,
                        strokeCapRound: true,
                        value: _animationController.value,),
                        GradientCircularProgressIndicator(
                          radius: 100,
                          colors: [Colors.blue.shade700, Colors.blue.shade200],
                          strokeWidth: 20,
                          value: _animationController.value,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: GradientCircularProgressIndicator(
                            colors: [
                              Colors.blue.shade700,
                              Colors.blue.shade300
                            ],
                            radius: 100,
                            strokeWidth: 20,
                            value: _animationController.value,
                            strokeCapRound: true,
                          ),
                        ),
                      ClipRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: .5,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 8),
                            child: SizedBox(
                              child: TurnBox(
                                turns: .75,
                                child: GradientCircularProgressIndicator(
                                  colors: [Colors.teal, Colors.cyan.shade500],
                                  radius: 100,
                                  strokeWidth: 8,
                                  value: _animationController.value,
                                  totalAngle: pi,
                                  strokeCapRound: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 104,
                        width: 200,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              height: 200,
                                top: .0,
                                child: TurnBox(
                                  turns: .75,
                                  child: GradientCircularProgressIndicator(
                                    colors: [Colors.teal, Colors.cyan.shade500],
                                    radius: 100,
                                    strokeWidth: 8.0,
                                    value: _animationController.value,
                                    totalAngle: pi,
                                    strokeCapRound: true,
                                  ),
                                ),
                            ),
                            Padding(padding: const EdgeInsets.only(top: 10), child: Text("${(_animationController.value * 100).toInt()}%", style: const TextStyle(fontSize: 25, color: Colors.blueGrey),), )
                          ],
                        ),
                      )
                      ],
                  )
                ],
              ),);
            },
          )
        ],
      ),
    );
  }

}
