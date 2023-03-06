
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableWidgetPagerViewAndCachePager extends StatefulWidget {
  const ScrollableWidgetPagerViewAndCachePager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_pagerview";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetPagerViewAndCacheState();
  }

}

class _ScrollableWidgetPagerViewAndCacheState extends State<ScrollableWidgetPagerViewAndCachePager>{
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];

    for(int i = 0; i < 6;i++) {
      children.add(Pager(text: i.toString()));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("PagerView和页面缓存"),
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
                          "PageView",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("如果要实现页面切换和 Tab 布局，我们可以使用 PageView 组件。需要注意，PageView 是一个非常重要的组件，因为在移动端开发中很常用，比如大多数 App 都包含 Tab 换页效果、图片轮动以及抖音上下滑页切换视频功能等等，这些都可以通过 PageView 轻松实现。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""PageView({
  Key? key,
  this.scrollDirection = Axis.horizontal, // 滑动方向
  this.reverse = false,
  PageController? controller,
  this.physics,
  List<Widget> children = const <Widget>[],
  this.onPageChanged,
  
  //每次滑动是否强制切换整个页面，如果为false，则会根据实际的滑动距离显示页面
  this.pageSnapping = true,
  //主要是配合辅助功能用的，后面解释
  this.allowImplicitScrolling = false,
  //后面解释
  this.padEnds = true,
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          height: 200,
                          child: PageView(
                            scrollDirection: Axis.vertical,
                            pageSnapping: false,
                            children: children,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pager extends StatefulWidget {
  const Pager({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  State<StatefulWidget> createState() {
    return _PagerState();
  }

}

class _PagerState extends State<Pager>{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.text, textScaleFactor: 5,),);
  }
}
