import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverheaderdelegate.dart';

class SnapAppBarSample extends StatefulWidget {
  const SnapAppBarSample({Key? key}) : super(key: key);
  static const String route = "snapappbarsample";

  @override
  State<StatefulWidget> createState() {
    return SnapAppBarSampleState();
  }
}

class SnapAppBarSampleState extends State<SnapAppBarSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              floating: true,
              snap: true,
              expandedHeight: 200,
              forceElevated: innerBoxIsScrolled,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/avatar.jpg",fit: BoxFit.cover,),
              ),
            )
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [buildSliverList(100)],
            );
          },
        ),
      ),
    );
  }
}
