
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverheaderdelegate.dart';

class NestedScrollViewSample extends StatefulWidget {
  const NestedScrollViewSample({Key? key}) : super(key: key);
  static const String route = "nestedscrollviewsample";

  @override
  State<StatefulWidget> createState() {
    return NestedScrollViewSampleState();
  }
}

class NestedScrollViewSampleState extends State<NestedScrollViewSample> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget> [
            SliverAppBar(
              title: Text("嵌套ListView"),
              pinned: true,
              forceElevated: innerBoxIsScrolled,
            ),
            buildSliverList(5), //构建一个 sliverList
          ];
        }, body: ListView.builder(
        padding: const EdgeInsets.all(10),
          physics: const ClampingScrollPhysics(),
          itemCount: 30,
          itemBuilder: (BuildContext context, int index){
          return SizedBox(height: 50, child: Center(child: Text('Item $index'),),);
      }),
      ),
    );
  }
}
