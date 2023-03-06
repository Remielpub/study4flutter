import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgetIntroducePager extends StatefulWidget {
  const LayoutWidgetIntroducePager({Key? key}) : super(key: key);
  static const String route = "layout_widget_introduce";

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetIntroduceState();
  }
}

class _LayoutWidgetIntroduceState extends State<LayoutWidgetIntroducePager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局类组件简介"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: const [
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.yellow),
                  child:
                      Text("LeafRenderObjectWidget --- 非容器类组件基类,Widget树的叶子节点，用于"
                          "没有子节点的widget，通常基础组件都属于这一类，如Image。"),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Text(
                      "SingleChildRenderObjectWidget --- 单子组件基类,包含一个子Widget，如：ConstrainedBox、DecoratedBox等。"),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(color: Colors.yellow),
                  child: Text(
                      "LeafRenderObjectWidget --- 多子组件基类,包含多个子Widget，一般都有一个children参数，接受一个Widget数组。如Row、Column、Stack等。"),
                )
              ],
            ),
          ),
          Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  color: Colors.red,
                  child: const Text("布局类组件就是指直接或间接继承(包含)SingleChildRenderObjectWidget 和MultiChildRenderObjectWidget的Widget，它们一般都会有一个child或children属性用于接收子 Widget。我们看一下继承关系 Widget > RenderObjectWidget > (Leaf/SingleChild/MultiChild)RenderObjectWidget 。"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  color: Colors.red,
                  child: const Text("RenderObjectWidget类中定义了创建、更新RenderObject的方法，子类必须实现他们，关于RenderObject我们现在只需要知道它是最终布局、渲染UI界面的对象即可，也就是说，对于布局类组件来说，其布局算法都是通过对应的RenderObject对象来实现的"),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
