import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCircularProgressIndicatorPager extends StatefulWidget {
  const WidgetCircularProgressIndicatorPager({Key? key}) : super(key: key);

  static const String route = "circularprogressindicator";

  @override
  State<StatefulWidget> createState() {
    return _WidgetCircularProgressIndicatorState();
  }
}

class _WidgetCircularProgressIndicatorState
    extends State<WidgetCircularProgressIndicatorPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CircularProgressIndicator --- 圆形进度条"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.all(10),
              child: const SizedBox(
                width: 100,
                height: 100,
                child: CircularProgressIndicator(
                backgroundColor: Colors.tealAccent,
                color: Colors.red,
                strokeWidth: 5,
              ),)
            ),
            Container(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.all(10),
              child: const CircularProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.tealAccent,
                color: Colors.red,
                strokeWidth: 5,
              ),
            ),
          ],
        ));
  }
}
