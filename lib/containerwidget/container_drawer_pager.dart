import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/containerwidget/container_scaffold_pager.dart';

class ContainerDrawerPager extends StatefulWidget {
  const ContainerDrawerPager({Key? key}) : super(key: key);
  static const String route = "container_drawer";

  @override
  State<StatefulWidget> createState() {
    return _ContainerDrawerState();
  }
}

class _ContainerDrawerState extends State<ContainerDrawerPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer"),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                ));
          },
        ),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [],
      ),
    );
  }
}
