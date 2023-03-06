
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/functionalwidget/functional_widget_valuelistenablebuilder.dart';
import 'package:flutter_demo/utils/widget_util.dart';

import 'functinal_widget_inheritedwidget.dart';
import 'functinal_widget_willpopscope.dart';
import 'functional_widget_color_and_theme.dart';
import 'functional_widget_cross_component_state_sharing.dart';
import 'functional_widget_dialog.dart';
import 'functional_widget_futurebuilder_and_streambuilder.dart';

class FunctionalRoutePager extends StatelessWidget {
  const FunctionalRoutePager({Key? key}) : super(key: key);

  static const String route = "functionalroutepager";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("功能型Widget简介"),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(10),
                  child: const Text("功能型Widget指的是不会影响UI布局及外观的Widget，它们通常具有一定的功能，如事件监听、数据存储等，我们之前介绍过的FocusScope（焦点控制）、PageStorage（数据存储）、NotificationListener（事件监听）都属于功能型Widget。由于Widget是Flutter的一等公民，功能型Widget非常多，我们不会去一一介绍，本章中主要介绍几种常用的功能型Widget。"),
                ),

                titleWidget(context, "导航返回拦截（WillPopScope）", 0, _onPress),
                titleWidget(context, "数据共享（InheritedWidget）", 1, _onPress),
                titleWidget(context, "跨组件状态共享", 2, _onPress),
                titleWidget(context, "颜色和主题", 3, _onPress),
                titleWidget(context, "按需rebuild（ValueListenableBuilder）", 4, _onPress),
                titleWidget(context, "异步UI更新（FutureBuilder、StreamBuilder）", 5, _onPress),
                titleWidget(context, "对话框详解", 6, _onPress),

              ],
            ),
          ),
        ),
      );
  }


  _onPress(BuildContext context, int i) {
    String? route;
    switch(i) {
      case 0:
        route = WillPopScopeSample.route;
        break;
      case 1:
        route = FunctionalWidgetInheritedWidget.route;
        break;
      case 2:
        route = FunctionalWidgetCrollComponentStateSharing.route;
        break;
      case 3:
        route = FunctionalWidgetColorAndTheme.route;
        break;
      case 4:
        route = FunctionalWidgetValueListenableBuilder.route;
        break;
      case 5:
        route = FunctionalWidgetFutureBuilderAndStreamBuilder.route;
        break;
      case 6:
        route = FunctionalWidgetDialog.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, route!);
    };
  }
}
