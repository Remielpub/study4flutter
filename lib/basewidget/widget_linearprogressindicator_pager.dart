import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetLinearProgressIndicatorPager extends StatefulWidget {
  const WidgetLinearProgressIndicatorPager({Key? key}) : super(key: key);
  static const String route = "linearprogressindicator";

  @override
  State<StatefulWidget> createState() {
    return _WidgetLinearProgressIndicatorPagerState();
  }
}

class _WidgetLinearProgressIndicatorPagerState
    extends State<WidgetLinearProgressIndicatorPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("LinearProgressIndicator --- 线性、条状的进度条"),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.all(10),
              child: const LinearProgressIndicator(
                backgroundColor: Colors.tealAccent,
                color: Colors.red,
                minHeight: 5,
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.all(10),
              child: const LinearProgressIndicator(
                value: 0.3,
                backgroundColor: Colors.tealAccent,
                color: Colors.red,
                minHeight: 5,
              ),
            ),
          ],
        ));
  }
}
