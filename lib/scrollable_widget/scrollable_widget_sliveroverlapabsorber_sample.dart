import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverheaderdelegate.dart';

class SnapAppBarSample2 extends StatefulWidget {
  const SnapAppBarSample2({Key? key}) : super(key: key);
  static const String route = "snapappbarsample2";

  @override
  State<StatefulWidget> createState() {
    return SnapAppBarSampleState2();
  }
}

class SnapAppBarSampleState2 extends State<SnapAppBarSample2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver:  SliverAppBar(
              floating: true,
              snap: true,
              expandedHeight: 200,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/avatar.jpg",fit: BoxFit.cover,),
              ),
              forceElevated: innerBoxIsScrolled,
            ),)
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: [
                SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                buildSliverList(100)
              ],
            );
          },
        ),
      ),
    );
  }
}
