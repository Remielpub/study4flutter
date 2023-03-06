import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutWidgetLinearLayoutPager extends StatefulWidget {
  const LayoutWidgetLinearLayoutPager({Key? key}) : super(key: key);
  static const String route = "layout_widget_linearlayout";

  @override
  State<StatefulWidget> createState() {
    return _LayoutWidgetLinearLayoutState();
  }
}

class _LayoutWidgetLinearLayoutState
    extends State<LayoutWidgetLinearLayoutPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局（Row和Column）"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: const Text(
                    "所谓线性布局，即指沿水平或垂直方向排列子组件。Flutter 中通过Row和Column来实现线性布局，类似于Android 中的LinearLayout控件。Row和Column都继承自Flex"),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: const Text(
                          "主轴和纵轴",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        margin: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        child: const Text(
                          """对于线性布局，有主轴和纵轴之分，如果布局是沿水平方向，那么主轴就是指水平方向，而纵轴即垂直方向；如果布局沿垂直方向，那么主轴就是指垂直方向，而纵轴就是水平方向。在线性布局中，有两个定义对齐方式的枚举类MainAxisAlignment和CrossAxisAlignment，分别代表主轴对齐和纵轴对齐。\n""",
                        ),
                        margin: const EdgeInsets.only(top: 5),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: const Text(
                        "Row",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      margin: const EdgeInsets.only(top: 5),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: const Text("""Row({
  ...  
  TextDirection textDirection,    
  MainAxisSize mainAxisSize = MainAxisSize.max,    
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  VerticalDirection verticalDirection = VerticalDirection.down,  
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  List<Widget> children = const <Widget>[],
})"""),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      child: const Text(
                          "textDirection：表示水平方向子组件的布局顺序(是从左往右还是从右往左)，默认为系统当前Locale环境的文本方向(如中文、英语都是从左往右，而阿拉伯语是从右往左)。"),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      child: const Text(
                          "mainAxisSize：表示Row在主轴(水平)方向占用的空间，默认是MainAxisSize.max，表示尽可能多的占用水平方向的空间，此时无论子 widgets 实际占用多少水平空间，Row的宽度始终等于水平方向的最大宽度；而MainAxisSize.min表示尽可能少的占用水平空间，当子组件没有占满水平剩余空间，则Row的实际宽度等于所有子组件占用的的水平空间；"),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      child: const Text(
                          "mainAxisAlignment：表示子组件在Row所占用的水平空间内对齐方式，如果mainAxisSize值为MainAxisSize.min，则此属性无意义，因为子组件的宽度等于Row的宽度。只有当mainAxisSize的值为MainAxisSize.max时，此属性才有意义，MainAxisAlignment.start表示沿textDirection的初始方向对齐，如textDirection取值为TextDirection.ltr时，则MainAxisAlignment.start表示左对齐，textDirection取值为TextDirection.rtl时表示从右对齐。而MainAxisAlignment.end和MainAxisAlignment.start正好相反；MainAxisAlignment.center表示居中对齐。读者可以这么理解：textDirection是mainAxisAlignment的参考系"),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      child: const Text(
                          "verticalDirection：表示Row纵轴（垂直）的对齐方向，默认是VerticalDirection.down，表示从上到下。"),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      child: const Text(
                          "crossAxisAlignment：表示子组件在纵轴方向的对齐方式，Row的高度等于子组件中最高的子元素高度，它的取值和MainAxisAlignment一样(包含start、end、 center三个值)，不同的是crossAxisAlignment的参考系是verticalDirection，即verticalDirection值为VerticalDirection.down时crossAxisAlignment.start指顶部对齐，verticalDirection值为VerticalDirection.up时，crossAxisAlignment.start指底部对齐；而crossAxisAlignment.end和crossAxisAlignment.start正好相反；"),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("children ：子组件数组"),
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50.0,
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        verticalDirection: VerticalDirection.up,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [Text("啊哈哈哈哈")],
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      height: 50.0,
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        textDirection: TextDirection.ltr,
                        mainAxisSize: MainAxisSize.min,
                        verticalDirection: VerticalDirection.down,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [Text("啊哈哈哈哈")],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: const Text(
                          "Column",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        margin: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "使用方法与Row相同"
                        ),
                        margin: const EdgeInsets.only(top: 5),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        child: const Text(
                          "特殊情况",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        margin: const EdgeInsets.only(top: 5),
                        alignment: Alignment.centerLeft,
                      ),
                      Container(
                        child: const Text(
                            "如果Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，里面Row或Column所占用的空间为实际大小。如果要让里面的Column占满外部Column，可以使用Expanded 组件"
                        ),
                        margin: const EdgeInsets.only(top: 5),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
