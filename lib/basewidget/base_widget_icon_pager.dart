
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetIconPager extends StatefulWidget {
  const WidgetIconPager({Key? key}) : super(key: key);
  static const route = "widget_icon";

  @override
  State<StatefulWidget> createState() {
    return _WidgetIconPager();
  }
}

class _WidgetIconPager extends State<WidgetIconPager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WidgetIconPager"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.settings, color: Colors.tealAccent,),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.style, color: Colors.pink,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(Icons.accessible_outlined, color: Colors.green,),
            ),
          ],
        ),
      ),
    );
  }

}
