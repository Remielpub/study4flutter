import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/keep_alive_wrapper.dart';

class ScrollableWidgetScrollableCachePager extends StatefulWidget {
  const ScrollableWidgetScrollableCachePager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_scrollable_cache";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetScrollableState();
  }
}

class _ScrollableWidgetScrollableState
    extends State<ScrollableWidgetScrollableCachePager> {
  @override
  Widget build(BuildContext context) {
    var children1 = <Widget>[];
    var children2 = <Widget>[];

    for (int i = 0; i < 6; i++) {
      children1.add(Pager(text: i.toString(), type: 0,));
      children2.add(
          KeepAliveWrapper(keepAlive: false, child: Pager(text: i.toString(), type: 1,)));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("可滚动组件子项缓存"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: const Text(
                    """在介绍 ListView 时，有一个addAutomaticKeepAlives 属性我们并没有介绍，如果addAutomaticKeepAlives 为 true，则 ListView 会为每一个列表项添加一个 AutomaticKeepAlive 父组件。虽然 PageView 的默认构造函数和 PageView.builder 构造函数中没有该参数，但它们最终都会生成一个 SliverChildDelegate 来负责列表项的按需加载，而在 SliverChildDelegate 中每当列表项构建完成后，SliverChildDelegate 都会为其添加一个 AutomaticKeepAlive 父组件。下面我们就先介绍一下 AutomaticKeepAlive 组件"""),
              ),
              Container(
                color: Colors.yellow,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      child: const Text(
                        "AutomaticKeepAlive",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """AutomaticKeepAlive 的组件的主要作用是将列表项的根 RenderObject 的 keepAlive 按需自动标记 为 true 或 false。为了方便叙述，我们可以认为根 RenderObject 对应的组件就是列表项的根 Widget，代表整个列表项组件，同时我们将列表组件的 Viewport区域 + cacheExtent（预渲染区域）称为加载区域 ："""),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                          """1.当 keepAlive 标记为 false 时，如果列表项滑出加载区域时，列表组件将会被销毁。
2.当 keepAlive 标记为 true 时，当列表项滑出加载区域后，Viewport 会将列表组件缓存起来；当列表项进入加载区域时，Viewport 从先从缓存中查找是否已经缓存，如果有则直接复用，如果没有则重新创建列表项。"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "那么 AutomaticKeepAlive 什么时候会将列表项的 keepAlive 标记为 true 或 false 呢？答案是开发者说了算！Flutter 中实现了一套类似 C/S 的机制，AutomaticKeepAlive 就类似一个 Server，它的子组件可以是 Client，这样子组件想改变是否需要缓存的状态时就向 AutomaticKeepAlive 发一个通知消息（KeepAliveNotification），AutomaticKeepAlive 收到消息后会去更改 keepAlive 的状态，如果有必要同时做一些资源清理的工作（比如 keepAlive 从 true 变为 false 时，要释放缓存）。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "我们基于上一节 PageView 示例，实现页面缓存，根据上面的描述实现思路就很简单了：让Page 页变成一个 AutomaticKeepAlive Client 即可。为了便于开发者实现，Flutter 提供了一个 AutomaticKeepAliveClientMixin ，我们只需要让 PageState 混入这个 mixin，且同时添加一些必要操作即可"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 200,
                        child: PageView(
                          scrollDirection: Axis.vertical,
                          pageSnapping: false,
                          children: children1,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "代码很简单，我们只需要提供一个 wantKeepAlive，它会表示 AutomaticKeepAlive 是否需要缓存当前列表项；另外我们必须在 build 方法中调用一下 super.build(context)，该方法实现在 AutomaticKeepAliveClientMixin 中，功能就是根据当前 wantKeepAlive 的值给 AutomaticKeepAlive 发送消息，AutomaticKeepAlive 收到消息后就会开始工作"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "需要注意，如果我们采用 PageView.custom 构建页面时没有给列表项包装 AutomaticKeepAlive 父组件，则上述方案不能正常工作，因为此时Client 发出消息后，找不到 Server，404 了"),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("自定义KeepAliveWrapper 实现缓存", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 200,
                        child: PageView(
                          scrollDirection: Axis.vertical,
                          pageSnapping: false,
                          children: children2,
                        ),
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
}

class Pager extends StatefulWidget {
  const Pager({Key? key, required this.text, required this.type}) : super(key: key);

  final String text;

  final int type;

  @override
  State<StatefulWidget> createState() {
    State<StatefulWidget> target;

    if(type == 0) {
      target = _PagerState1();
    } else {
      target = _PagerState2();
    }
    return target;
  }
}

class _PagerState1 extends State<Pager> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print(" build Pager1 --- ${widget.text}");
    return Center(
      child: Text(
        widget.text,
        textScaleFactor: 5,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _PagerState2 extends State<Pager> {
  @override
  Widget build(BuildContext context) {
    print(" build Pager2 --- ${widget.text}");
    return Center(
      child: Text(
        widget.text,
        textScaleFactor: 5,
      ),
    );
  }
}
