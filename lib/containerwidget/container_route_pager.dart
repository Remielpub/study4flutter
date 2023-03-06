
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/containerwidget/container_container_pager.dart';

import '../utils/widget_util.dart';
import 'container_appbar_pager.dart';
import 'container_button_tag_pager.dart';
import 'container_clip_pager.dart';
import 'container_decoratedbox_pager.dart';
import 'container_drawer_pager.dart';
import 'container_fittedbox_pager.dart';
import 'container_floatingactionbutton_pager.dart';
import 'container_padding_pager.dart';
import 'container_scaffold_pager.dart';
import 'container_transform_pager.dart';

class ContainerRoutePager extends StatefulWidget {
  const ContainerRoutePager({Key? key}) : super(key: key);
  static const String route = "container_route";

  @override
  State<StatefulWidget> createState() {
    return _ContainerRouteState();
  }
}

class _ContainerRouteState extends State<ContainerRoutePager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("容器类组件"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: onTextPressed(context, 0),
                child: textcontainer("填充容器 --- Padding"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 1),
                child: textcontainer("装饰容器 --- DecoratedBox"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 2),
                child: textcontainer("变换容器 --- Transform"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 3),
                child: textcontainer("容器组件 --- Container"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 4),
                child: textcontainer("裁剪容器 --- Clip"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 5),
                child: textcontainer("空间适配容器 --- FittedBox ？？？"),
              ),
              textcontainer("页面骨架 --- Scaffold"),
              TextButton(
                onPressed: onTextPressed(context, 6),
                child: textcontainer2("Scaffold"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 7),
                child: textcontainer2("AppBar"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 8),
                child: textcontainer2("抽屉菜单Drawer"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 9),
                child: textcontainer2("FloatingActionButton"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 10),
                child: textcontainer2("底部Tab导航栏"),
              ),
            ],
          ),
        ),
      )
    );
  }

  onTextPressed(BuildContext context, int index) {
    String? routekey;
    switch(index) {
      case 0:
        routekey = ContainerPaddingPager.route;
        break;
      case 1:
        routekey = ContainerDecoratedBoxPager.route;
        break;
      case 2:
        routekey = ContainerTransformPager.route;
        break;
      case 4:
        routekey = ContainerClipPager.route;
        break;
      case 3:
        routekey = ContainerContainerPager.route;
        break;
      case 5:
        routekey = ContainerFittedBoxPager.route;
        break;
      case 6:
        routekey = ContainerScaffoldPager.route;
        break;
      case 7:
        routekey = ContainerAppBarPager.route;
        break;
      case 8:
        routekey = ContainerDrawerPager.route;
        break;
      case 9:
        routekey = ContainerFloatingActionButtonPager.route;
        break;
      case 10:
        routekey = ContainerBottomTagPager.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routekey!);
    };
  }

}
