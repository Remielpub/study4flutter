import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverToBoxAdaptersSample extends StatefulWidget {
  const SliverToBoxAdaptersSample({Key? key}) : super(key: key);
  static const String route = "slivertoboxadapter_sample";

  @override
  State<StatefulWidget> createState() => _SliverToBoxAdaptersSampleState();
}

class _SliverToBoxAdaptersSampleState extends State<SliverToBoxAdaptersSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverToBoxAdapter示例"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: PageView(
                children:  [
                  Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text("1", textScaleFactor: 5,),
                  ),
                  Container(
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: const Text("2", textScaleFactor: 5,),
                  ),
                ],
              ),
            ),
          ),
          buildSliverFixedList()
        ],
      ),
    );
    //   Material(
    //   child: CustomScrollView(
    //     slivers: [
    //       SliverToBoxAdapter(
    //         child: SizedBox(
    //           child: PageView(
    //             children: const [Text("1"), Text("2")],
    //           ),
    //         ),
    //       ),
    //        buildSliverFixedList()
    //     ],
    //   ),
    // );
  }

 Widget buildSliverFixedList() {
    var sliver = SliverFixedExtentList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
      return ListTile(title: Text('$index'),);
    },childCount: 10), itemExtent: 50);
    return sliver;
  }
}
