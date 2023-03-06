
import 'package:flutter/material.dart';

import '../utils/widget_util.dart';
import 'custom_components_checkbox.dart';
import 'custom_components_circle_gradient_progress.dart';
import 'custom_components_combination.dart';
import 'custom_components_custompaint_and_canvas.dart';
import 'custom_components_done_widget.dart';
import 'custom_components_introduce.dart';
import 'custom_components_sample_turnbox.dart';

class CustomComponentsRoute extends StatelessWidget {
  const CustomComponentsRoute({Key? key}) : super(key: key);

  static const String route = "CustomComponentsRoute";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自定义组件"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                  onPressed: onPressed(context, 0), child: textcontainer("自定义组件方法简介")),
              TextButton(
                  onPressed: onPressed(context, 1), child: textcontainer("组合现有组件")),
              TextButton(
                  onPressed: onPressed(context, 2), child: textcontainer("组合示例：TurnBox")),
              TextButton(
                  onPressed: onPressed(context, 3), child: textcontainer("CustomPaint 与 Canvas")),
              TextButton(
                  onPressed: onPressed(context, 4), child: textcontainer("自绘实例：圆形背景渐变进度条")),
              TextButton(
                  onPressed: onPressed(context, 5), child: textcontainer("自绘组件：CustomCheckbox")),
              TextButton(
                  onPressed: onPressed(context, 6), child: textcontainer("自绘组件：DoneWidget")),
              TextButton(
                  onPressed: onPressed(context, 7), child: textcontainer("水印实例：文本绘制与离屏渲染")),
            ],
          ),
        ),
      ),
    );
  }

  onPressed(BuildContext context, int i) {
    String? route;
    switch(i) {
      case 0:
        route = CustomComponentsIntroduce.route;
        break;
      case 1:
        route = CustomComponentsCombination.route;
        break;
      case 2:
        route = TurnBoxSample.route;
        break;
      case 3:
        route = CustomePaintAndCanvasRoute.route;
        break;
      case 4:
        route = CustomComponentsCircleGradientProgress.route;
        break;
      case 5:
        route = CustomComponentCheckBox.route;
        break;
      case 6:
        route = CustomComponentsDoneWidget.route;
        break;
    }

    return () {
      Navigator.of(context).pushNamed(route!);
    };
  }

}
