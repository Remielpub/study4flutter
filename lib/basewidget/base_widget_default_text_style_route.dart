import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetDefaultTextStyleRoute extends StatelessWidget {
  const BaseWidgetDefaultTextStyleRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" DefaultTextStyle 属性"),
      ),
      body: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.red,
            backgroundColor: Colors.deepOrangeAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("DefaultTextStyle 1"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("DefaultTextStyle 2"),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text("DefaultTextStyle 3"),
            )
          ],
        ),
      ),
    );
  }
}
