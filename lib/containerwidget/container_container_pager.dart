import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerContainerPager extends StatefulWidget {
  const ContainerContainerPager({Key? key}) : super(key: key);
  static const String route = "container_container";

  @override
  State<StatefulWidget> createState() {
    return _ContainerContainerState();
  }
}

class _ContainerContainerState extends State<ContainerContainerPager> {
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
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: const Text("Container是一个组合类容器，它本身不对应具体的RenderObject，"
                    "它是DecoratedBox、ConstrainedBox、Transform、Padding、"
                    "Align等组件组合的一个多功能容器，所以我们只需通过一个Container组件可以"
                    "实现同时需要装饰、变换、限制的场景。"),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text("Container --- alignment: Alignment.center"),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child:
                    const Text("Container --- alignment: Alignment.centerLeft"),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text("Container --- transform --- rotationZ"),
                transform: Matrix4.rotationZ(.2),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text("Container --- decoration --- 设置背景及阴影"),
                transform: Matrix4.rotationZ(.2),
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.red, Colors.cyanAccent],
                        center: Alignment.topLeft,
                        radius: 10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text(
                    "Container --- color和decoration是互斥的，如果同时设置它们则会报错！实际上，当指定color时，Container内会自动创建一个decoration"),
                transform: Matrix4.rotationZ(.2),
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.red, Colors.cyanAccent],
                        center: Alignment.topLeft,
                        radius: 10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: const Text("Container --- decoration --- 设置前景（遮盖层）及阴影"),
                transform: Matrix4.rotationZ(.2),
                foregroundDecoration: const BoxDecoration(
                    gradient: RadialGradient(
                        colors: [Colors.black45, Colors.cyanAccent],
                        center: Alignment.topLeft,
                        radius: 10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ]),
              ),
              Container(
                width: 100,
                height: 100,
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 80),
                alignment: Alignment.center,
                child: const Text(
                    "Container --- constraints属性 --- BoxConstraints 设置宽度"),
                constraints:
                    const BoxConstraints(maxWidth: 300, maxHeight: 100),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                    top: 10, left: 10, right: 10, bottom: 10),
                alignment: Alignment.center,
                child: const Text("容器的大小可以通过width、height属性来指定，也可以通过constraints来"
                    "指定；如果它们同时存在时，width、height优先。实际上Container内"
                    "部会根据width、height来生成一个constraints"),
              ),
            ],
          ),
        )));
  }
}
