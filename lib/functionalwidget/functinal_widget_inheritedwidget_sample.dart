import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/share_data_widget.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class FunctionalWidgetInheritedSampleWidget extends StatefulWidget {
  const FunctionalWidgetInheritedSampleWidget({Key? key}) : super(key: key);
  static const String route = "functionalwidgetinheritedsamplewidget";

  @override
  State<StatefulWidget> createState() {
    return FunctionalWidgetInheritedWidgetSampleState();
  }
}

class FunctionalWidgetInheritedWidgetSampleState extends State<FunctionalWidgetInheritedSampleWidget> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("共享数据 --- 共享计数器示例"),
      ),
      body: Center(
        child: ShareDataWidget(data: count, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(10),
              child: _TestWidget(),
            ),
            ElevatedButton(onPressed: () {
              setState(() {
                ++count;
              });
            },
            child: const Text("Increment"))
          ],
        ),
          
        ),
      )
    );
  }
}

class _TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextWidgetState();
  }

}

class _TextWidgetState extends State<_TestWidget>{
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}
