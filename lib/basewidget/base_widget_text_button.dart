
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetTextButtonPager extends StatefulWidget {
  const BaseWidgetTextButtonPager({Key? key}) : super(key: key);
  static const String route = "text_button";

  @override
  State<StatefulWidget> createState() {
    return _BaseWidgetTextButtonPagerState();
  }
  
}

class _BaseWidgetTextButtonPagerState extends State<BaseWidgetTextButtonPager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextButton"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {

              },
              child: const Text(" TextButton即文本按钮，默认背景透明并不带阴影。按下后，会有背景色"),
            ),
          )

        ],
      ),
    );
  }
}
