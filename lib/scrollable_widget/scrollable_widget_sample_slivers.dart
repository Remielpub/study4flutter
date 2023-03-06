import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSliversSample extends StatefulWidget {
  const CustomSliversSample({Key? key}) : super(key: key);
  static const String route = "custom_slivers_sample";

  @override
  State<StatefulWidget> createState() => _CustomSliversSampleState();
}

class _CustomSliversSampleState extends State<CustomSliversSample> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true, // 滑动到顶端时会固定住
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("常用Sliver 示例"),
              background: Image.asset("assets/avatar.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverPadding(padding: const EdgeInsets.all(10),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 4.0
              ),
              delegate: SliverChildBuilderDelegate((BuildContext context,
                  int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.cyan[100 * (index % 9)],
                  child: Text('grid item $index'),
                );
              },
                  childCount: 20

              ),
            ),),
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('list item $index'),
                );
              },
              childCount: 20,
            ), itemExtent: 50,
          )
        ],
      ),
    );
  }
}
