import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/sliver_flexible_header.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverheaderdelegate.dart';

class SliverFlexibleHeaderSample extends StatelessWidget {
  const SliverFlexibleHeaderSample({Key? key}) : super(key: key);
  static String route = "SliverFlexibleHeaderSample";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SliverFlexibleHeaderSample"),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          SliverFlexibleHeader(
            builder: (BuildContext context, double maxExtent) {
              return GestureDetector(
                onTap: () => print('tap'),
                child: Image(
                  image: const AssetImage("assets/avatar.jpg"),
                  width: 50.0,
                  height: maxExtent,
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          buildSliverList(30),
        ],
      ),
    );
  }
}
