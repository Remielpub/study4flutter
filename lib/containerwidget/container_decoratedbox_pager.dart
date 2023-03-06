import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/element_decorationbox.dart';

class ContainerDecoratedBoxPager extends StatefulWidget {
  const ContainerDecoratedBoxPager({Key? key}) : super(key: key);
  static const String route = "container_decoratedbox";

  @override
  State<StatefulWidget> createState() {
    return _ContainerDecoratedBoxState();
  }
}

class _ContainerDecoratedBoxState extends State<ContainerDecoratedBoxPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DecoratedBox"),
      ),
      body: Column(
        children: [
          DecoratedBox(
              decoration: CustomDecoration(),
              position: DecorationPosition.background,
              child: Container(
                margin: const EdgeInsets.all(10),
                color: Colors.blue,
                child: const Text("DecoratedBox --- 自定义画笔绘制"),
              )),

          // Color color, //颜色
          // DecorationImage image,//图片
          // BoxBorder border, //边框
          // BorderRadiusGeometry borderRadius, //圆角
          // List<BoxShadow> boxShadow, //阴影,可以指定多个
          // Gradient gradient, //渐变
          // BlendMode backgroundBlendMode, //背景混合模式
          // BoxShape shape = BoxShape.rectangle, //形状
          //
          // 下面的例子中使用了LinearGradient类，它用于定义线性渐变的类，Flutter中还提供了
          // 其他渐变配置类，如RadialGradient、SweepGradient，读者若有需要可以自行查看
          // API文档
          DecoratedBox(
              decoration: BoxDecoration(
                  gradient:
                      const LinearGradient(colors: [Colors.red, Colors.yellow]),
                  borderRadius: BorderRadius.circular(3.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0, 10.0), //按钮阴影 x， y 轴偏移量（阴影宽度）
                        blurRadius: 4.0)
                  ]),
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 80.0, vertical: 18.0),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
