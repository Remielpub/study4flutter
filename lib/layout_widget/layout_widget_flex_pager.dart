import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgetFLexPager extends StatefulWidget {
  const LayoutWidgetFLexPager({Key? key}) : super(key: key);
  static const String route = "layout_widget_flex";

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetFlexState();
  }
}

class _LayoutWidgetFlexState extends State<LayoutWidgetFLexPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("弹性布局（FLex)"),
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: const Text(
                    "弹性布局允许子组件按照一定比例来分配父容器空间。弹性布局的概念在其他UI系统中也都存在，如 H5 中的弹性盒子布局，Android中 的FlexboxLayout等。Flutter 中的弹性布局主要通过Flex和Expanded来配合实现。"),
              ),
              Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Flex：",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""Flex({
  ...
  required this.direction, //弹性布局的方向, Row默认为水平方向，Column默认为垂直方向
  List<Widget> children = const <Widget>[],
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "Flex继承自MultiChildRenderObjectWidget，对应的RenderObject为RenderFlex，RenderFlex中实现了其布局算法。"),
                      )
                    ],
                  )),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "Expanded：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "Expanded 只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”Flex子组件所占用的空间。因为 Row和Column 都继承自 Flex，所以 Expanded 也可以作为它们的孩子。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const Expanded({
  int flex = 1, 
  required Widget child,
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "flex参数为弹性系数，如果为 0 或null，则child是没有弹性的，即不会被扩伸占用的空间。如果大于0，所有的Expanded按照其 flex 的比例来分割主轴的全部空闲空间"),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: Container(
                            height: 30.0,
                            color: Colors.red,
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: Container(
                            height: 30.0,
                            color: Colors.cyan,
                          ),
                          flex: 2,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 100.0,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.red,
                              ),
                              flex: 2,
                            ),
                            const Spacer(
                              flex: 5,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.cyan,
                              ),
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
