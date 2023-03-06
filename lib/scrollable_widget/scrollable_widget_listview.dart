import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class ScrollableWidgetListViewPager extends StatefulWidget {
  const ScrollableWidgetListViewPager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_listview";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetListViewState();
  }
}

class _ScrollableWidgetListViewState
    extends State<ScrollableWidgetListViewPager> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];
  List<String> items = <String>['1', '2', '3', '4', '5'];

  @override
  Widget build(BuildContext context) {
    Widget divider1 = const Divider(
      color: Colors.blue,
    );
    Widget divider2 = const Divider(
      color: Colors.green,
    );
    var appbar = AppBar(
      title: const Text("可滚动组件简介"),
    );
    return Scaffold(
      appBar: appbar,
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
                        "构造函数",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text("""ListView({
  ...  
  //可滚动widget公共参数
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController? controller,
  bool? primary,
  ScrollPhysics? physics,
  EdgeInsetsGeometry? padding,
  
  //ListView各个构造函数的共同参数  
  double? itemExtent,
  Widget? prototypeItem, //列表项原型，后面解释
  bool shrinkWrap = false,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double? cacheExtent, // 预渲染区域长度
    
  //子widget列表
  List<Widget> children = const <Widget>[],
})"""),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("重点参数:"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "1.itemExtent：该参数如果不为null，则会强制children的“长度”为itemExtent的值；这里的“长度”是指滚动方向上子组件的长度，也就是说如果滚动方向是垂直方向，则itemExtent代表子组件的高度；如果滚动方向为水平方向，则itemExtent就代表子组件的宽度。在ListView中，指定itemExtent比让子组件自己决定自身长度会有更好的性能，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，而无需每次构建子组件时都去再计算一下，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "2.prototypeItem：如果我们知道列表中的所有列表项长度都相同但不知道具体是多少，这时我们可以指定一个列表项，该列表项被称为 prototypeItem（列表项原型）。指定 prototypeItem 后，可滚动组件会在 layout 时计算一次它延主轴方向的长度，这样也就预先知道了所有列表项的延主轴方向的长度，所以和指定 itemExtent 一样，指定 prototypeItem 会有更好的性能。注意，itemExtent 和prototypeItem 互斥，不能同时指定它们。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "3.shrinkWrap：该属性表示是否根据子组件的总长度来设置ListView的长度，默认值为false 。默认情况下，ListView会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "4.addRepaintBoundaries：该属性表示是否将列表项（子组件）包裹在RepaintBoundary组件中。RepaintBoundary 读者可以先简单理解为它是一个”绘制边界“，将列表项包裹在RepaintBoundary中可以避免列表项不必要的重绘，但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效（具体原因会在本书后面 Flutter 绘制原理相关章节中介绍）。如果列表项自身来维护是否需要添加绘制边界组件，则此参数应该指定为 false。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "5.默认构造函数有一个children参数，它接受一个Widget列表（List<Widget>）。这种方式适合只有少量的子组件数量已知且比较少的情况，反之则应该使用ListView.builder 按需动态构建列表项。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ListView(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(20),
                        children: [
                          Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text("item 1"),
                          ),
                          Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text("item 2"),
                          ),
                          Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text("item 3"),
                          ),
                          Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text("item 4"),
                          ),
                          Container(
                            color: Colors.red,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text("item 5"),
                          ),
                        ],
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
                        child: const Text(
                          " ListView.builder",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""ListView.builder({
  // ListView公共参数已省略  
  ...
  required IndexedWidgetBuilder itemBuilder,
  int itemCount,
  ...
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """itemBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。当列表滚动到具体的index位置时，会调用该构建器构建列表项。
itemCount：列表项的数量，如果为null，则为无限列表"""),
                      ),
                    ],
                  )),
              Row(
                children: [
                  Expanded(
                      child: SizedBox(
                    height: 200.0,
                    child: ListView.builder(
                        itemCount: 10,
                        shrinkWrap: false,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(title: Text("$index"));
                        }),
                  ))
                ],
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "ListView.separated",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "ListView.separated可以在生成的列表项之间添加一个分割组件，它比ListView.builder多了一个separatorBuilder参数，该参数是一个分割组件生成器"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 300,
                        child: ListView.separated(
                          itemCount: 20,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Container(
                                alignment: Alignment.center,
                                height: 50,
                                color: Colors.red,
                                child: Text("$index"),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return index % 2 == 0 ? divider1 : divider2;
                          },
                        ),
                      ),
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
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "固定高度列表",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "给列表指定 itemExtent 或 prototypeItem 会有更高的性能，所以当我们知道列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 300,
                        child: ListView.builder(
                          itemCount: 10,
                          prototypeItem: Container(
                            height: 30,
                            child: const Text("1"),
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              color: Colors.blue,
                              alignment: Alignment.center,
                              height: 30,
                              child: Text("第 $index 项"),
                            );
                          },
                        ),
                      ),
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
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        "ListView 原理",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "ListView 内部组合了 Scrollable、Viewport 和 Sliver，需要注意："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """1.ListView 中的列表项组件都是 RenderBox，并不是 Sliver， 这个一定要注意。
2.一个 ListView 中只有一个Sliver，对列表项进行按需加载的逻辑是 Sliver 中实现的。
3.ListView 的 Sliver 默认是 SliverList，如果指定了 itemExtent ，则会使用 SliverFixedExtentList；如果 prototypeItem 属性不为空，则会使用 SliverPrototypeExtentList，无论是是哪个，都实现了子组件的按需加载模型。"""),
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
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        " 实例：无限加载列表",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          const ListTile(
                            title: Text("列表头"),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                appbar.preferredSize.height -
                                100,
                            child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  if (_words[index] == loadingTag) {
                                    //不足100条，继续获取数据
                                    if (_words.length - 1 < 100) {
                                      //获取数据
                                      _getMoreData();
                                      //加载时显示loading
                                      return Container(
                                        padding: const EdgeInsets.all(16.0),
                                        alignment: Alignment.center,
                                        child: const SizedBox(
                                          width: 24.0,
                                          height: 24.0,
                                          child: CircularProgressIndicator(
                                              strokeWidth: 2.0),
                                        ),
                                      );
                                    } else {
                                      //已经加载了100条数据，不再获取数据。
                                      return Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(16.0),
                                        child: const Text(
                                          "没有更多了",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      );
                                    }
                                  }
                                  //显示单词列表项
                                  return ListTile(title: Text(_words[index]));
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const Divider(color: Colors.red);
                                },
                                itemCount: _words.length,
                            shrinkWrap: true,),
                          )
                        ],
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
                      child: const Text(
                        "ListView.custom 用法",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      // child: SizedBox(
                      child: ListView.custom(
                        shrinkWrap: true,
                        childrenDelegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return KeepAlive(
                            data: items[index],
                            key: ValueKey<String>(items[index]),
                          );
                        }, childCount: items.length),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _getMoreData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({
    required Key key,
    required this.data,
  }) : super(key: key);

  final String data;

  @override
  State<KeepAlive> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(widget.data);
  }
}
