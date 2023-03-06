import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgetAlignPager extends StatefulWidget {
  const LayoutWidgetAlignPager({Key? key}) : super(key: key);
  static const String route = "layout_widget_align";

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetAlignState();
  }
}

class _LayoutWidgetAlignState extends State<LayoutWidgetAlignPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("对齐与相对定位（Align）"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(10),
                  child: const Text("Align 主要作用 --- 简单的调整一个子元素在父元素中的位置")),
              Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Align",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""Align({
  Key key,
  this.alignment = Alignment.center,
  this.widthFactor,
  this.heightFactor,
  Widget child,
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "alignment : 需要一个AlignmentGeometry类型的值，表示子组件在父组件中的起始位置。AlignmentGeometry 是一个抽象类，它有两个常用的子类：Alignment和 FractionalOffset，"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "widthFactor和heightFactor是用于确定Align 组件本身宽高的属性；它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高。如果值为null，则组件的宽高将会占用尽可能多的空间。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("通过设置父组件宽高属性，设置子组件宽高："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Container(
                          height: 120.0,
                          width: 120.0,
                          color: Colors.red.shade900,
                          child: const Align(
                            alignment: Alignment.center,
                            child: FlutterLogo(
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child:
                            const Text("通过设置Align组件宽高因子，通过Align子组件宽度，设置子组件宽高："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Container(
                          color: Colors.red.shade900,
                          child: const Align(
                            widthFactor: 3,
                            heightFactor: 3,
                            alignment: Alignment.topLeft,
                            child: FlutterLogo(
                              size: 60,
                            ),
                          ),
                        ),
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
                        "Alignment",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "Alignment继承自AlignmentGeometry，表示矩形内的一个点，他有两个属性x、y，分别表示在水平和垂直方向的偏移，Alignment定义如下："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Alignment(this.x, this.y)"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0) 。x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离，因此2个水平（或垂直）单位则等于矩形的宽（或高），如Alignment(-1.0, -1.0) 代表矩形的左侧顶点，而Alignment(1.0, 1.0)代表右侧底部终点，而Alignment(1.0, -1.0) 则正是右侧顶点，即Alignment.topRight。为了使用方便，矩形的原点、四个顶点，以及四条边的终点在Alignment类中都已经定义为了静态常量。\n"""
                          """Alignment可以通过其坐标转换公式将其坐标转为子元素的具体偏移坐标：\n"""
                          """(Alignment.x*childWidth/2+childWidth/2, Alignment.y*childHeight/2+childHeight/2)"""),
                    ),
                    Container(
                      color: Colors.deepOrange,
                      margin: const EdgeInsets.only(top: 30),
                      child: const Align(
                        widthFactor: 2.0,
                        heightFactor: 2.0,
                        alignment: Alignment(-2.0, -2.0),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: const Alignment(-1, -1),
                      child: const Text(
                        "FractionalOffset",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！FractionalOffset 的坐标原点为矩形的左侧顶点，这和布局系统的一致，所以理解起来会比较容易。FractionalOffset的坐标转换公式为: \n"
                          "实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)"),
                    ),
                    Container(
                      color: Colors.red[300],
                      margin: const EdgeInsets.only(top: 10),
                      child: const Align(
                        widthFactor: 2.0,
                        heightFactor: 2.0,
                        alignment: FractionalOffset(0.5, 0.5),
                        child: FlutterLogo(
                          size: 60,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("Align和Stack对比", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("可以看到，Align和Stack/Positioned都可以用于指定子元素相对于父元素的偏移，但它们还是有两个主要区别："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，最终的偏移是需要通过alignment的转换公式来计算出。"""
                      """2.Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠。"""),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      child: const Text("Center"),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Center继承自Align，它比Align只少了一个alignment 参数；由于Align的构造函数中alignment 值为Alignment.center，"
                          "所以，我们可以认为Center组件其实是对齐方式确定（Alignment.center）了的Align。上面我们讲过当widthFactor或heightFactor为"
                          "null时组件的宽高将会占用尽可能多的空间，这一点需要特别注意，我们通过一个示例说明"),
                    ),
                    Container(
                      color: Colors.red,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Center(
                        widthFactor: 3,
                        heightFactor: 3,
                        child: Text("Hello World"),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Center(
                        heightFactor: 3,
                        child: Text("Hello World"),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
