import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetElevatedButtonPager extends StatefulWidget {
  const BaseWidgetElevatedButtonPager({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetElevatedButtonPager();
  }
}

class _BaseWidgetElevatedButtonPager
    extends State<BaseWidgetElevatedButtonPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ElevatedButton"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
          ),
          onPressed: () {
            log("ElevatedButton 点击");
          },
          child: const Text("ElevatedButton '漂浮'按钮，它默认带有阴影和灰色背景。按下后，阴影会变大"),
        ),
      ),
    );
  }
}
