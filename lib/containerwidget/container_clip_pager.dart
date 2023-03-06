import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerClipPager extends StatefulWidget {
  const ContainerClipPager({Key? key}) : super(key: key);
  static const String route = "container_clip";

  @override
  State<StatefulWidget> createState() {
    return _ContainerClipState();
  }
}

class _ContainerClipState extends State<ContainerClipPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Container"),
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
          child: Column(
            children: [
              ClipOval(
                  child: Container(
                alignment: Alignment.center,
                color: Colors.red,
                width: 200,
                height: 200,
                child: const Text("ClipOval --- 子组件为正方形时剪裁成内贴圆形；为矩形时，剪裁成内贴椭圆"),
              )),
              ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: Colors.red,
                    width: 200,
                    child: const Text("ClipRRect --- 将子组件剪裁为圆角矩形"),
                  )),
              ClipRect(
                child: Align(
                  alignment: Alignment.topLeft,
                  widthFactor: .5,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    color: Colors.red,
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: const Text("ClipRect --- 默认剪裁掉子组件布局空间之外的绘制内容（溢出部分剪裁）"),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                child: ClipRect(
                  clipper: MyClipper(),
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                ),
              ),
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),
                child: ClipRect(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: const Text("自定义裁剪 --- 继承CustomClipper"),
              )
            ],
          ),
        )));
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}
