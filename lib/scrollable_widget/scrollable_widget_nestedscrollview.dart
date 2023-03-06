
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_nestedscrollview_sample.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sliveroverlapabsorber_sample.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_withtabbarview_sample.dart';
import 'package:flutter_demo/utils/widget_util.dart';

import 'scrollable_widget_snapappbar_sample.dart';

class ScrollableWidgetNestedScrollViewPager extends StatefulWidget {
  const ScrollableWidgetNestedScrollViewPager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_nestedscrollview";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetNestedScrollViewState();
  }
}

class _ScrollableWidgetNestedScrollViewState
    extends State<ScrollableWidgetNestedScrollViewPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("嵌套可滚动组件 NestedScrollView"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  color: Colors.yellow,
                  child: Column(
                    children: [
                      const Text(
                        "NestedScrollView",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "我们知道 CustomScrollView 只能组合 Sliver，如果有孩子也是一个可滚动组件（通过 SliverToBoxAdapter 嵌入）且它们的滑动方向一致时便不能正常工作。为了解决这个问题，Flutter 中提供了一个NestedScrollView 组件，它的功能时组合（协调）两个可滚动组件，下面我们看看它的定义："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text("""const NestedScrollView({
  ... //省略可滚动组件的通用属性
  //header，sliver构造器
  required this.headerSliverBuilder,
  //可以接受任意的可滚动组件
  required this.body,
  this.floatHeaderSlivers = false,
}) """),
                      ),
                      titleWidget(context, "示例", 0, _onPress),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""页面有三部分组成：
1.最上面是一个 AppBar，实现导航，要能固定在顶端
2.AppBar 下面是一个 SliverList，可以有任意多个列表项，为了演示，我们指定5个列表项即可。
3.最下面是一个 ListView。"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("NestedScrollView 在逻辑上将可滚动组件分为了 header 和 body 两部分，header 部分我们可以认为是外部可滚动组件（outer scroll view），可以认为这个可滚动组件就是 CustomScrollView ，所以它只能接收 Sliver，我们通过headerSliverBuilder 来构建一个 Sliver 列表给外部的可滚动组件；而 body 部分可以接收任意的可滚动组件，该可滚动组件称为内部可滚动组件 （inner scroll view）。"),
                      )
                    ],
                  )),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                color: Colors.yellow,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(10),
                      child: const Text("NestedScrollView 原理", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset("assets/20230221150130.jpg"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.NestedScrollView 整体就是一个 CustomScrollView （实际上是 CustomScrollView 的一个子类）
2.header 和 body 都是 CustomScrollView 的子 Sliver ，注意，虽然 body 是一个 RenderBox，但是它会被包装为 Sliver 。
3.CustomScrollView 将其所有子 Sliver 在逻辑上分为 header 和 body 两部分：header 是前面部分、body 是后面部分。
4.当 body 是一个可滚动组件时， 它和 CustomScrollView 分别有一个 Scrollable ，由于 body 在 CustomScrollView 的内部，所以称其为内部可滚动组件，称 CustomScrollView 为外部可滚动组件；同时 因为 header 部分是 Sliver，所以没有独立的 Scrollable，滑动时是受 CustomScrollView 的 Scrollable 控制，所以为了区分，可以称 header 为外部可滚动组件（Flutter 文档中是这么约定的）。
5.NestedScrollView 核心功能就是通过一个协调器来协调外部可滚动组件和内部可滚动组件的滚动，以使滑动效果连贯统一，协调器的实现原理就是分别给内外可滚动组件分别设置一个 controller，然后通过这两个controller 来协调控制它们的滚动"""),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("综上，在使用 NestedScrollView 有两点需要注意："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.要确认内部的可滚动组件（body）的 physics 是否需要设置为 ClampingScrollPhysics。比如上面的示例运行在 iOS 中时，ListView 如果没有设置为 ClampingScrollPhysics，则用户快速滑动到顶部时，会执行一个弹性效果，此时 ListView 就会与 header 显得割裂（滑动效果不统一），所以需要设置。但是，如果 header 中只有一个 SliverAppBar 则不应该加，因为 SliverAppBar 是固定在顶部的，ListView 滑动到顶部时上面已经没有要继续往下滑动的元素了，所以此时出现弹性效果是符合预期的。
2.内部的可滚动组件（body的）不能设置 controller 和 primary，这是因为 NestedScrollView 的协调器中已经指定了它的 controller，如果重新设定则协调器将会失效。"""),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.all(10),
                color: Colors.yellow,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("SliverAppBar"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("SliverAppBar 是 AppBar 的Sliver 版，大多数参数都相同，但 SliverAppBar 会有一些特有的功能，它最常见的使用场景是在作为 NestedScrollView 的 header,下面是 SliverAppBar 特有的一些配置："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const SliverAppBar({
  this.collapsedHeight, // 收缩起来的高度
  this.expandedHeight,// 展开时的高度
  this.pinned = false, // 是否固定
  this.floating = false, //是否漂浮
  this.snap = false, // 当漂浮时，此参数才有效
  bool forceElevated //导航栏下面是否一直显示阴影
  ...
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: const Text("""1.SliverAppBar 在 NestedScrollView 中随着用户的滑动是可以收缩和展开的，因此我们需要分别指定收缩和展开时的高度。
2.pinned 为true 时 SliverAppBar 会固定在 NestedScrollView 的顶部，行为 和 SliverPersistentHeader 的 pinned功能一致。
3.floating 和 snap：floating 为 true 时，SliverAppBar 不会固定到顶部，当用户向上滑动到顶部时，SliverAppBar 也会滑出可视窗口。当用户反向滑动时，SliverAppBar 的 snap 为 true 时，此时无论 SliverAppBar 已经滑出屏幕多远，都会立即回到屏幕顶部；但如果 snap 为 false，则 SliverAppBar 只有当向下滑到边界时才会重新回到屏幕顶部。这一点和 SliverPersistentHeader 的 floating 相似，但不同的是 SliverPersistentHeader 没有 snap 参数，当它的 floating 为 true 时，效果是等同于 SliverAppBar 的floating 和 snap 同时为 true 时的效果。"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们可以看到 SliverAppBar 的一些参数和 SliverPersistentHeader 很像，这是因为 SliverAppBar 内部就包含了一个 SliverPersistentHeader 组件，用于实现顶部固定和漂浮效果。"),
                    ),
                    titleWidget(context, "示例", 1, _onPress),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("当我们滑动到顶部时，然后反向轻微滑动一点点，这时 SliverAppBar 就会整体回到屏幕顶部，但这时有一个问题，注意图中红色圈出来的部分，我们发现 SliverAppBar 返回到屏幕后将 0 - 4 这几个列表项遮住了！而按照正常的交互逻辑，预期是不能遮住的，因为往下滑时，用户就是为了看上面的内容，SliverAppBar 突然整体回到屏幕后正好遮住了上面的内容，这时，用户不得不继续往下再滑动一些距离，这个体验很不好"),
                    ),
                    titleWidget(context, "修改上面示例效果", 2, _onPress),
                  ],
                ),
              ),
              titleWidget(context, "嵌套 TabBarView示例", 3, _onPress)
            ],
          ),
        ),
      ),
    );
  }

  _onPress(BuildContext context, int index) {
    String? routeKey;
    switch(index) {
      case 0:
        routeKey = NestedScrollViewSample.route;
        break;
      case 1:
        routeKey = SnapAppBarSample.route;
        break;
      case 2:
        routeKey = SnapAppBarSample2.route;
        break;
      case 3:
        routeKey = WithTabbarViewSample.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routeKey!);
    };
  }
}
