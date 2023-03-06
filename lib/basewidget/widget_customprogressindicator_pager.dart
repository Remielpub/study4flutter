import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCustomProgressIndicatorPager extends StatefulWidget {
  const WidgetCustomProgressIndicatorPager({Key? key}) : super(key: key);
  static const String route = "customprogressindicator";

  @override
  State<StatefulWidget> createState()=> _WidgetCustomProgressIndicatorState();

}

class _WidgetCustomProgressIndicatorState
    extends State<WidgetCustomProgressIndicatorPager>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    log("initState");

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _animationController ??= AnimationController(
        vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
        duration: const Duration(seconds: 3),
      )
        ..forward()
        ..addListener(() => setState(() => {}));

    return Scaffold(
        appBar: AppBar(
          title: const Text("CustomProgressIndicator --- 自定义进度条样式"),
        ),
        body: Column(
          children: [
            const Text("自定义尺寸"),
            Container(
                padding: EdgeInsets.zero,
                margin: const EdgeInsets.all(10),
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orangeAccent,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    strokeWidth: 5,
                  ),
                )),
            Container(
                padding: EdgeInsets.zero,
                margin: const EdgeInsets.all(10),
                child: const SizedBox(
                  width: 100,
                  height: 50,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orangeAccent,
                    strokeWidth: 5,
                  ),
                )),
            const Text("自定义进度色动画"),
            Container(
                padding: EdgeInsets.zero,
                margin: const EdgeInsets.all(10),
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.orangeAccent,
                    valueColor: AlwaysStoppedAnimation(Colors.blue),
                    strokeWidth: 5,
                  ),
                )),
            const Text("自定义进度指示器样式 --- 定制进度指示器风格样式，可以通过CustomPainter Widget 来自定义绘制逻辑，实际上LinearProgressIndicator和CircularProgressIndicator也正是通过CustomPainter来实现外观绘制的。关于CustomPainter，我们将在后面“自定义Widget”一章中详细介绍, https://pub.flutter-io.cn/packages/flutter_spinkit"),
          ],
        ));
  }
}
