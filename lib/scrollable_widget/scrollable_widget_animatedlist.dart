import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableWidgetAnimatedListPager extends StatefulWidget {
  const ScrollableWidgetAnimatedListPager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_animatedlist";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetAnimatedListState();
  }
}

class _ScrollableWidgetAnimatedListState
    extends State<ScrollableWidgetAnimatedListPager> {
  int count = 5;
  var data = <String>[];
  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (var i = 0; i < count; i++) {
      data.add('${i + 1}');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text("AnimatedList"),
    );
    return Scaffold(
        appBar: appBar,
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
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "AnimatedList 和 ListView 的功能大体相似，不同的是， AnimatedList 可以在列表中插入或删除节点时执行一个动画，在需要添加或删除列表项的场景中会提高用户体验。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "AnimatedList 是一个 StatefulWidget，它对应的 State 类型为 AnimatedListState，添加和删除元素的方法位于 AnimatedListState 中："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """void insertItem(int index, { Duration duration = _kDuration });
void removeItem(int index, AnimatedListRemovedItemBuilder builder, { Duration duration = _kDuration }) ;"""),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height -
                                appBar.preferredSize.height -
                                300,
                            child: Stack(
                              children: [
                                AnimatedList(
                                    key: globalKey,
                                    initialItemCount: data.length,
                                    itemBuilder: (BuildContext context,
                                        int index,
                                        Animation<double> animation) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: buildItem(context, index),
                                      );
                                    }),
                                buildBtAdd()
                              ],
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget buildItem(BuildContext context, int index) {
    String char = data[index];
    return ListTile(
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          onDelete(context, index);
        },
      ),
    );
  }

  void onDelete(BuildContext context, int index) {
    setState(() {
      globalKey.currentState!.removeItem(index, (context, animation) {
        var item = buildItem(context, index);
        print('删除 ${data[index]}');
        data.removeAt(index);
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: const Interval(0.5, 1.0),
          ),
          child: SizeTransition(
            sizeFactor: animation,
            axisAlignment: 0,
            child: item,
          ),
        );
      }, duration: const Duration(milliseconds: 300));
    });
  }

  // 创建一个 “+” 按钮，点击后会向列表中插入一项
  Widget buildBtAdd() {
    return Positioned(
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 添加一个列表项
          data.add('${++count}');
          // 告诉列表项有新添加的列表项
          globalKey.currentState!.insertItem(data.length - 1);
          print('添加 $count');
        },
      ),
      bottom: 30,
      left: 0,
      right: 0,
    );
  }
}
