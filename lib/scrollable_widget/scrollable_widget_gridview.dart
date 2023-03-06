import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableWidgetGridViewPager extends StatefulWidget {
  const ScrollableWidgetGridViewPager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_gridView";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetGridViewState();
  }
}

class _ScrollableWidgetGridViewState
    extends State<ScrollableWidgetGridViewPager> {
  List<IconData> _icons = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getIconData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
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
                        "默认构造函数",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""GridView({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    required this.gridDelegate,  //下面解释
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    double? cacheExtent, 
    List<Widget> children = const <Widget>[],
    ...
  })"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "我们可以看到，GridView和ListView的大多数参数都是相同的，它们的含义也都相同的，如有疑惑读者可以翻阅ListView一节，在此不再赘述。我们唯一需要关注的是gridDelegate参数，类型是SliverGridDelegate，它的作用是控制GridView子组件如何排列(layout)。SliverGridDelegate是一个抽象类，定义了GridView Layout相关接口，子类需要通过实现它们来实现具体的布局算法。Flutter中提供了两个SliverGridDelegate的子类SliverGridDelegateWithFixedCrossAxisCount和SliverGridDelegateWithMaxCrossAxisExtent，我们可以直接使用，"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "1.SliverGridDelegateWithFixedCrossAxisCount",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("该子类实现了一个横轴为固定数量子元素的layout算法，其构造函数为："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """SliverGridDelegateWithFixedCrossAxisCount({
  @required double crossAxisCount, 
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        """1.crossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了，即ViewPort横轴长度除以crossAxisCount的商。
2.mainAxisSpacing：主轴方向的间距。
3.crossAxisSpacing：横轴方向子元素的间距。
4.childAspectRatio：子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后，子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。""",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 200,
                          child: GridView(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            children: const [
                              Icon(Icons.add_alert_sharp),
                              Icon(Icons.add_alert_sharp),
                              Icon(Icons.add_alert_sharp),
                              Icon(Icons.add_alert_sharp),
                              Icon(Icons.add_alert_sharp),
                              Icon(Icons.add_alert_sharp),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "2.SliverGridDelegateWithMaxCrossAxisExtent",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child:
                          const Text("该子类实现了一个横轴子元素为固定最大长度的layout算法，其构造函数为："),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """SliverGridDelegateWithMaxCrossAxisExtent({
  double maxCrossAxisExtent,
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "maxCrossAxisExtent为子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的，举个例子，如果ViewPort的横轴长度是450，那么当maxCrossAxisExtent的值在区间[450/4，450/3)内的话，子元素最终实际长度都为112.5，而childAspectRatio所指的子元素横轴和主轴的长度比为最终的长度比。其他参数和SliverGridDelegateWithFixedCrossAxisCount相同。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 200,
                        child: GridView(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100.0,
                                  childAspectRatio: 2.0),
                          children: const [
                            Icon(Icons.ac_unit),
                            Icon(Icons.airport_shuttle),
                            Icon(Icons.all_inclusive),
                            Icon(Icons.beach_access),
                            Icon(Icons.cake),
                            Icon(Icons.free_breakfast),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "GridView.count",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，我们通过它可以快速的创建横轴固定数量子元素的GridView，我们可以通过以下代码实现和上面例子相同的效果等："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 200,
                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 1.0,
                          children: const [
                            Icon(Icons.ac_unit),
                            Icon(Icons.airport_shuttle),
                            Icon(Icons.all_inclusive),
                            Icon(Icons.beach_access),
                            Icon(Icons.cake),
                            Icon(Icons.free_breakfast),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "GridView.extent",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，我们通过它可以快速的创建横轴子元素为固定最大长度的的GridView，上面的示例代码等价于"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""GridView.extent(
   maxCrossAxisExtent: 100.0,
   childAspectRatio: 2.0,
   children: <Widget>[
     Icon(Icons.ac_unit),
     Icon(Icons.airport_shuttle),
     Icon(Icons.all_inclusive),
     Icon(Icons.beach_access),
     Icon(Icons.cake),
     Icon(Icons.free_breakfast),
   ],
 );"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 200,
                        child: GridView.extent(
                          maxCrossAxisExtent: 100,
                          childAspectRatio: 2.0,
                          children: const [
                            Icon(Icons.ac_unit),
                            Icon(Icons.airport_shuttle),
                            Icon(Icons.all_inclusive),
                            Icon(Icons.beach_access),
                            Icon(Icons.cake),
                            Icon(Icons.free_breakfast),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  "GridView.builder",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                    "上面我们介绍的GridView都需要一个widget数组作为其子元素，这些方式都会提前将所有子widget都构建好，所以只适用于子widget数量比较少时，当子widget比较多时，我们可以通过GridView.builder来动态创建子widget。GridView.builder 必须指定的参数有两个："),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text("""GridView.builder(
 ...
 required SliverGridDelegate gridDelegate, 
 required IndexedWidgetBuilder itemBuilder,
)"""),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 200,
                  child: GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 3.0
                  ),
                  itemCount: _icons.length,
                  itemBuilder: (context, index) {
                    //如果显示到最后一个并且Icon总数小于200时继续获取数据
                    if (index == _icons.length - 1 && _icons.length < 200) {
                      _getIconData();
                    }
                    return Icon(_icons[index]);
                  } ,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _getIconData() {
    Future.delayed(const Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast,
        ]);
      });
    });
  }
}
