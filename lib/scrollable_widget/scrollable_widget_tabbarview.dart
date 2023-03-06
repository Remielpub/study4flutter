import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/keep_alive_wrapper.dart';

class ScrollableWidgetTabBarViewPager extends StatefulWidget {
  const ScrollableWidgetTabBarViewPager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_tabbarview";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetTabBarViewState();
  }
}

class _ScrollableWidgetTabBarViewState
    extends State<ScrollableWidgetTabBarViewPager> with SingleTickerProviderStateMixin{
  List tabs = ["新闻", "历史", "图片"];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TabBarView"),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e,)).toList(),
        ),
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
                        "TabBarView",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "TabBarView 是 Material 组件库中提供了 Tab 布局组件，通常和 TabBar 配合使用。TabBarView 封装了 PageView，它的构造方法很简单,"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""TabBarView({
  Key? key,
  required this.children, // tab 页
  this.controller, // TabController
  this.physics,
  this.dragStartBehavior = DragStartBehavior.start,
}) """),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "TabController 用于监听和控制 TabBarView 的页面切换，通常和 TabBar 联动。如果没有指定，则会在组件树中向上查找并使用最近的一个 DefaultTabController "),
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
                        "TabBar",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("TabBar 为 TabBarView 的导航标题"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "TabBar 有很多配置参数，通过这些参数我们可以定义 TabBar 的样式，很多属性都是在配置 indicator 和 label，拿上图来举例，Label 是每个Tab 的文本，indicator 指 “历史” 下面的白色下划线。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const TabBar({
  Key? key,
  required this.tabs, // 具体的 Tabs，需要我们创建
  this.controller,
  this.isScrollable = false, // 是否可以滑动
  this.padding,
  this.indicatorColor,// 指示器颜色，默认是高度为2的一条下划线
  this.automaticIndicatorColorAdjustment = true,
  this.indicatorWeight = 2.0,// 指示器高度
  this.indicatorPadding = EdgeInsets.zero, //指示器padding
  this.indicator, // 指示器
  this.indicatorSize, // 指示器长度，有两个可选值，一个tab的长度，一个是label长度
  this.labelColor, 
  this.labelStyle,
  this.labelPadding,
  this.unselectedLabelColor,
  this.unselectedLabelStyle,
  this.mouseCursor,
  this.onTap,
  ...
}) """),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "TabBar 通常位于 AppBar 的底部，它也可以接收一个 TabController ，如果需要和 TabBarView 联动， TabBar 和 TabBarView 使用同一个 TabController 即可，注意，联动时 TabBar 和 TabBarView 的孩子数量需要一致。如果没有指定 controller，则会在组件树中向上查找并使用最近的一个 DefaultTabController 。另外我们需要创建需要的 tab 并通过 tabs 传给 TabBar， tab 可以是任何 Widget，不过Material 组件库中已经实现了一个 Tab 组件，我们一般都会直接使用它："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const Tab({
  Key? key,
  this.text, //文本
  this.icon, // 图标
  this.iconMargin = const EdgeInsets.only(bottom: 10.0),
  this.height,
  this.child, // 自定义 widget
})"""),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("注意，text 和 child 是互斥的，不能同时制定。"),
                    ),
                    SizedBox(height: 100,
                    child: TabBarView(
                      controller: _tabController,
                      children: tabs
                          .map((e) => KeepAliveWrapper(
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(e, textScaleFactor: 5),
                          )))
                          .toList(),
                    ),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
