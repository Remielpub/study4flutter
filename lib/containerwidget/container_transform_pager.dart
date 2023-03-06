import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ContainerTransformPager extends StatefulWidget {
  const ContainerTransformPager({Key? key}) : super(key: key);
  static const String route = "container_transform";

  @override
  State<StatefulWidget> createState() {
    return _ContainerTransformState();
  }
}

class _ContainerTransformState extends State<ContainerTransformPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transform"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
            child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: Transform.translate(
              offset: const Offset(10.0, 10.0),
              child: const Text("Transform --- translate: 平移"),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.yellow),
              child: Transform.rotate(
                angle: math.pi / 2,
                child: const Text("Transform --- rotate: 旋转"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.yellow),
              child: Transform.scale(
                scale: 3.0,
                child: const Text("Transform --- scale: 缩放"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.yellow),
              child: Transform.scale(
                scale: 1.0,
                child: const Text("Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以"
                    "无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变"
                    "的，因为这些是在布局阶段就确定的，类似Android --- Maxtirx 与 平移动画，"
                    "只修改了显示，但View实际位置未发生变化"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.yellow),
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("BoxDecoration --- 旋转: 缩放"),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.yellow),
              child: RotatedBox(
                quarterTurns: 4,
                child: Text("由于RotatedBox是作用于layout阶段，所以子组件会旋转90度"
                    "（而不只是绘制的内容），decoration会作用到子组件所占用的实际空间上，"
                    "所以最终就是上图的效果，读者可以和前面Transform.rotate示例对比理解"),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
