import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_animatedlist.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_customscrollview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_cutomsliver.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_gridview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_introduce.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_listener_and_control.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_listview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_nestedScrollView.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_pagerview_and_cache.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_scrollable.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_singlechildscrollview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_tabbarview.dart';

import '../utils/widget_util.dart';

class ScrollableWidgetRoutePager extends StatefulWidget {
  const ScrollableWidgetRoutePager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_route";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetRouteState();
  }
}

class _ScrollableWidgetRouteState extends State<ScrollableWidgetRoutePager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("可滚动组件"),
        ),
        body: Scrollbar(
            child: SingleChildScrollView(
          child: Column(
            children: [
              titleWidget(context, "简介", 0, _onPressed),
              titleWidget(context, "SingleChildScrollView", 1, _onPressed),
              titleWidget(context, "ListView", 2, _onPressed),
              titleWidget(context, "滚动监听及控制", 3, _onPressed),
              titleWidget(context, "AnimatedList", 4, _onPressed),
              titleWidget(context, "GridView", 5, _onPressed),
              titleWidget(context, "PageView与页面缓存", 6, _onPressed),
              titleWidget(context, "可滚动组件子项缓存", 7, _onPressed),
              titleWidget(context, "TabBarView", 8, _onPressed),
              titleWidget(context, "CustomScrollView 和 Slivers", 9, _onPressed),
              titleWidget(context, "自定义 Sliver", 10, _onPressed),
              titleWidget(context, "嵌套可滚动组件 NestedScrollView", 11, _onPressed),
            ],
          ),
        )));
  }

  _onPressed(BuildContext context, int i) {
    String? routeKey;
    switch (i) {
      //简介
      case 0:
        routeKey = ScrollableWidgetIntroducePager.route;
        break;
      //SingleChildScrollView
      case 1:
        routeKey = ScrollableWidgetSingleChildScrollViewPager.route;
        break;
      //ListView
      case 2:
        routeKey = ScrollableWidgetListViewPager.route;
        break;
      //滚动监听及控制
      case 3:
        routeKey = ScrollableWidgetListenerAndControlPager.route;
        break;
      //AnimatedList
      case 4:
        routeKey = ScrollableWidgetAnimatedListPager.route;
        break;
      //GridView
      case 5:
        routeKey = ScrollableWidgetGridViewPager.route;
        break;
      //PageView与页面缓存
      case 6:
        routeKey = ScrollableWidgetPagerViewAndCachePager.route;
        break;
      //可滚动组件子项缓存
      case 7:
        routeKey = ScrollableWidgetScrollableCachePager.route;
        break;
      //TabBarView
      case 8:
        routeKey = ScrollableWidgetTabBarViewPager.route;
        break;
      //CustomScrollView 和 Slivers
      case 9:
        routeKey = ScrollableWidgetCustomScrollViewPager.route;
        break;
      //自定义 Sliver
      case 10:
        routeKey = ScrollableWidgetCustomSliverPager.route;
        break;
      //嵌套可滚动组件 NestedScrollView
      case 11:
        routeKey = ScrollableWidgetNestedScrollViewPager.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routeKey!);
    };
  }
}
