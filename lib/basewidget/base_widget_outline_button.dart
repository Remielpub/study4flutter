
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetOutlineButtonPager extends StatefulWidget {
  const BaseWidgetOutlineButtonPager({Key? key}) : super(key: key);
  static const String route = "outline_button";

  @override
  State<StatefulWidget> createState() {
    return _OutlineButtonState();
  }

}

class _OutlineButtonState extends State<BaseWidgetOutlineButtonPager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OutlineButton"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: TextButton(onPressed: () {

        },
          child: const Text("OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)"),
        ),
      ),
    );
  }
}
