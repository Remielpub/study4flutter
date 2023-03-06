import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgetFrameLayoutPager extends StatefulWidget {
  const LayoutWidgetFrameLayoutPager({Key? key}) : super(key: key);
  static const String route = "layout_widget_framelayout";

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetFlexState();
  }
}

class _LayoutWidgetFlexState extends State<LayoutWidgetFrameLayoutPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("层叠布局（Stack、Positioned）"),
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
                      child: const Text(
                        "Stack：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""Stack({
  this.alignment = AlignmentDirectional.topStart,
  this.textDirection,
  this.fit = StackFit.loose,
  this.clipBehavior = Clip.hardEdge,
  List<Widget> children = const <Widget>[],
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "alignment：此参数决定如何去对齐没有定位（没有使用Positioned）或部分定位的子组件。所谓部分定位，在这里特指没有在某一个轴上定位：left、right为横轴，top、bottom为纵轴，只要包含某个轴上的一个定位属性就算在该轴上有定位。"),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "textDirection：和Row、Wrap的textDirection功能一样，都用于确定alignment对齐的参考系，即：textDirection的值为TextDirection.ltr，则alignment的start代表左，end代表右，即从左往右的顺序；textDirection的值为TextDirection.rtl，则alignment的start代表右，end代表左，即从右往左的顺序。")),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "fit：此参数用于确定没有定位的子组件如何去适应Stack的大小。StackFit.loose表示使用子组件的大小，StackFit.expand表示扩伸到Stack的大小。"),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "clipBehavior：此属性决定对超出Stack显示空间的部分如何剪裁，Clip枚举类中定义了剪裁的方式，Clip.hardEdge 表示直接剪裁，不应用抗锯齿，更多信息可以查看源码注释。")),
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
                      child: const Text(
                        "Positioned：",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""const Positioned({
  Key? key,
  this.left, 
  this.top,
  this.right,
  this.bottom,
  this.width,
  this.height,
  required Widget child,
})""")),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离。width和height用于指定需要定位元素的宽度和高度。注意，Positioned的width、height 和其他地方的意义稍微有点区别，此处用于配合left、top 、right、 bottom来定位组件，举个例子，在水平方向时，你只能指定left、right、width三个属性中的两个，如指定left和width后，right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理。")),
                  ],
                ),
              ),
              Container(
                color: Colors.cyan,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 100, minWidth: 100, maxWidth: 300, maxHeight: 300),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.loose,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: const Text("Hello world",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.red,
                      ),
                      const Positioned(
                        left: 18.0,
                        child: Text("I am Jack"),
                      ),
                      const Positioned(
                        top: 18.0,
                        child: Text("Your friend"),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  children: const [
                    Text("Stack  this.fit --- Stackfit.loose: 服从于父组件约束条件中的minWidth 与 minheight， 其他条件不传递"),
                    Text("Stack  this.fit --- Stackfit.expand: 服从于父组件约束条件中的maxWidth 与 maxheight，其他条件不传递"),
                    Text("Stack  this.fit --- Stackfit.passthrough: 完全服从于父组件约束条件")
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
