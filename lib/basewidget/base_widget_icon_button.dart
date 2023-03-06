
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconButtonPager extends StatefulWidget {
  const IconButtonPager({Key? key}) : super(key: key);
  static const String route = "icon_button";

  @override
  State<StatefulWidget> createState() {
    return _IconButtonPagerState();
  }

}

class _IconButtonPagerState extends State<IconButtonPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IconButton"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: IconButton(
          icon: const Icon(Icons.thumb_up),
          onPressed: () {},
        ),
      ),
    );
  }
}
