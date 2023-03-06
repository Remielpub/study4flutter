
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerFittedBoxPager extends StatefulWidget {
  const ContainerFittedBoxPager({Key? key}) : super(key: key);
  static const String route = "container_fittedbox";

  @override
  State<StatefulWidget> createState() {
      return _ContainerFittedBoxState();
  }

}

class _ContainerFittedBoxState extends State<ContainerFittedBoxPager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FittedBox"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: const [
                Text("1.FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。"),
                Text("2.FittedBox 对子组件布局结束后就可以获得子组件真实的大小"),
                Text("3.FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox 就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox 父组件的约束范围内按照指定的方式显示。")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: [Text("未使用Fitbox " * 20)],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Row(
                children: [Text("使用FitBox --- BoxFit.contain | " * 3)],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Row(
                children: [Text("使用FitBox --- BoxFit.contain | " * 3)],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
