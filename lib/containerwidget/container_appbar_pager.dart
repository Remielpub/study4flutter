import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerAppBarPager extends StatefulWidget {
  const ContainerAppBarPager({Key? key}) : super(key: key);
  static const String route = "container_appbar";

  @override
  State<StatefulWidget> createState() {
    return _ContainerAppBarState();
  }
}

class _ContainerAppBarState extends State<ContainerAppBarPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
      // this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
      // this.title,// 页面标题
      // this.actions, // 导航栏右侧菜单
      // this.bottom, // 导航栏底部菜单，通常为Tab按钮组
      // this.elevation = 4.0, // 导航栏阴影
      // this.centerTitle, //标题是否居中
      appBar: AppBar(
        title: const Text("AppBar"),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ));
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {

          }),
          IconButton(icon: Icon(Icons.margin), onPressed: () {

          }),

        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
