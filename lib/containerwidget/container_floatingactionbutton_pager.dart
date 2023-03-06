import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerFloatingActionButtonPager extends StatefulWidget {
  const ContainerFloatingActionButtonPager({Key? key}) : super(key: key);
  static const String route = "container_floatingactionbutton";

  @override
  State<StatefulWidget> createState() {
    return _ContainerFloatingActionButtonState();
  }
}

class _ContainerFloatingActionButtonState
    extends State<ContainerFloatingActionButtonPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FloatingActionButton"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("悬浮按钮"),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Column(
        children: [],
      ),
    );
  }
}
