import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScrollViewSample extends StatefulWidget {
  const CustomScrollViewSample({Key? key}) : super(key: key);
  static const String route = "custom_scrollview_sample";

  @override
  State<StatefulWidget> createState() => _CustomScrollViewSampleState();
}

class _CustomScrollViewSampleState extends State<CustomScrollViewSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomScrollViewSample"),
      ),
      body: buildTwoSliverList(),
    );
  }
}

Widget buildTwoSliverList() {
  var listView = SliverFixedExtentList(
    delegate: SliverChildBuilderDelegate(
        (_, index) => ListTile(title: Text('$index')),
        childCount: 10),
    itemExtent: 50,
  );
  return CustomScrollView(
    slivers: [listView, listView],
  );
}
