
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/sliver_header_delegate.dart';

class SliverHeaderDelegateSample extends StatelessWidget {
  const SliverHeaderDelegateSample({Key? key}) : super(key: key);
  static String route = "SliverHeaderDelegateSample";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverHeaderDelegateSample"),
      ),
      body: CustomScrollView(
        slivers: [
          buildSliverList(),
          SliverPersistentHeader(
            pinned: false,
            delegate: SliverHeaderDelegate(maxHeight: 80, minHeight: 50, child: buildHeader(1)),
          ),
          buildSliverList(),
          SliverPersistentHeader(
            pinned: false,
            delegate: SliverHeaderDelegate(maxHeight: 80, minHeight: 50, child: buildHeader(2)),
          ),
          buildSliverList(20),
        ],
      )
    );
  }

}

Widget buildHeader(int i) {
  return Container(
    color: Colors.lightBlue.shade200,
    alignment: Alignment.centerLeft,
    child: Text("PersistentHeader $i"),
  );
}

Widget buildSliverList([int count = 5]) {
  return SliverFixedExtentList(delegate: SliverChildBuilderDelegate(
      (context, index) {
        return ListTile(title: Text('$index'),);
      },
    childCount: count
  ), itemExtent: 50);
}
