import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/layout_widget/layout_widget_wrap_flow_pager.dart';
import '../utils/widget_util.dart';
import 'layout_widget_align_pager.dart';
import 'layout_widget_constraints_pager.dart';
import 'layout_widget_custom_layout_pager.dart';
import 'layout_widget_flex_pager.dart';
import 'layout_widget_framelayout_pager.dart';
import 'layout_widget_introduce_pager.dart';
import 'layout_widget_linearlayout_pager.dart';

class LayoutRoutePager extends StatefulWidget {
  const LayoutRoutePager({Key? key}) : super(key: key);
  static const String route = "layout_route";

  @override
  State<StatefulWidget> createState() {
    return _LayoutRoutePagerState();
  }
}

class _LayoutRoutePagerState extends State<LayoutRoutePager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("布局类组件"),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
              child: Column(
        children: [
          titleWidget(context, "简介", 0, _onPressed),
          titleWidget(context, "布局原理及约束（constraints）", 1, _onPressed),
          titleWidget(context, "线性布局（Row和Column）", 2, _onPressed),
          titleWidget(context, "弹性布局（FLex）", 3, _onPressed),
          titleWidget(context, "流式布局（Wrap、Flow）", 4, _onPressed),
          titleWidget(context, "层叠布局（Stack、Positioned）", 5, _onPressed),
          titleWidget(context, "对齐与相对定位（Align）", 6, _onPressed),
          titleWidget(context, "自定义布局（LayoutBuilder、AfterLayout）", 7, _onPressed),
        ],
      ))),
    );
  }

  _onPressed(BuildContext context, int i) {
    String? routeKey;
    switch (i) {
      //布局类组件简介
      case 0:
        routeKey = LayoutWidgetIntroducePager.route;
        break;
      //布局原理及约束（constraints）
      case 1:
        routeKey = LayoutWidgetConstraintsPager.route;
        break;
      //线性布局（Row和Column）
      case 2:
        routeKey = LayoutWidgetLinearLayoutPager.route;
        break;
      //弹性布局（FLex)
      case 3:
        routeKey = LayoutWidgetFLexPager.route;
        break;
      //流式布局（Wrap、Flow）
      case 4:
        routeKey = LayoutWidgetWrapFlowPager.route;
        break;
      //层叠布局（Stack、Positioned）
      case 5:
        routeKey = LayoutWidgetFrameLayoutPager.route;
        break;
      //对齐与相对定位（Align）
      case 6:
        routeKey = LayoutWidgetAlignPager.route;
        break;
      //自定义布局（LayoutBuilder、AfterLayout）
      case 7:
        routeKey = LayoutWidgetCustomLayoutPager.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routeKey!);
    };
  }
}
