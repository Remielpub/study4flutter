import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableWidgetSingleChildScrollViewPager extends StatefulWidget {
  const ScrollableWidgetSingleChildScrollViewPager({Key? key})
      : super(key: key);
  static const String route = "scrollable_widget_singlechildscrollview";

  @override
  State<StatefulWidget> createState() {
    return _SingleChildScrollViewState();
  }
}

class _SingleChildScrollViewState
    extends State<ScrollableWidgetSingleChildScrollViewPager> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: const Text("SingleChildScrollView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "简介",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子组件，定义如下："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""SingleChildScrollView({
  this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
  this.reverse = false, 
  this.padding, 
  bool primary, 
  this.physics, 
  this.controller,
  this.child,
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "除了上一节我们介绍过的可滚动组件的通用属性外，我们重点primary属性：它表示是否使用 widget 树中默认的PrimaryScrollController（MaterialApp 组件树中已经默认包含一个 PrimaryScrollController 了）；当滑动方向为垂直方向（scrollDirection值为Axis.vertical）并且没有指定controller时，primary默认为true。需要注意的是，通常SingleChildScrollView只应在期望的内容不会超过屏幕太多时使用，这是因为SingleChildScrollView不支持基于 Sliver 的延迟加载模型，所以如果预计视口可能包含超出屏幕尺寸太多的内容时，那么使用SingleChildScrollView将会非常昂贵（性能差），此时应该使用一些支持Sliver延迟加载的可滚动组件，如ListView。"),
                      )
                    ],
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: str
                      .split("")
                      .map((e) => Container(
                            color: Colors.red,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(5),
                            child: Text(
                              e,
                              textScaleFactor: 2.0,
                            ),
                          ))
                      .toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
