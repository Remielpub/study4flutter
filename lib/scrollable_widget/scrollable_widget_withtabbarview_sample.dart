import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverheaderdelegate.dart';

class WithTabbarViewSample extends StatelessWidget {
  const WithTabbarViewSample({Key? key}) : super(key: key);
  static const String route = "withtabbarviewsample";


  @override
  Widget build(BuildContext context) {
    final _tabs = <String>['猜你喜欢', '今日特价', '发现更多'];

    return DefaultTabController(length: _tabs.length, child: Scaffold(
      body: NestedScrollView(headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: const Text('商城'),
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
              bottom: TabBar(
                tabs: _tabs.map((e) => Tab(text: e,)).toList(),
              ),
            ),
          ),

        ];
      }, body: TabBarView(
        children: _tabs.map((String name) {
          return Builder(builder: (BuildContext context) {
            return CustomScrollView(
              key: PageStorageKey<String>(name),
              slivers: [
                SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                SliverPadding(padding: const EdgeInsets.all(10),
                sliver: buildSliverList(50),)
              ],
            );
          },);
        }).toList()
      ),

      ),
    ));
  }
}

