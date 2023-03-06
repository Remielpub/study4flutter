import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetTextSpanRoute extends StatelessWidget {
  const BaseWidgetTextSpanRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Span 属性"),
      ),
      body: Column(
        children: const [
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "http://www.baidu.com",
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
