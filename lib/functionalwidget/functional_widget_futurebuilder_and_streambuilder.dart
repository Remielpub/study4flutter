
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class FunctionalWidgetFutureBuilderAndStreamBuilder extends StatelessWidget {
  const FunctionalWidgetFutureBuilderAndStreamBuilder({Key? key}) : super(key: key);

  static const String route = "functionalwidgetfuturebuilderandstreambuilder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("异步UI更新（FutureBuilder、StreamBuilder）"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("很多时候我们会依赖一些异步数据来动态更新UI，比如在打开一个页面时我们需要先从互联网上获取数据，在获取数据的过程中我们显示一个加载框，等获取到数据时我们再渲染页面；又比如我们想展示Stream（比如文件流、互联网数据接收流）的进度。当然，通过 StatefulWidget 我们完全可以实现上述这些功能。但由于在实际开发中依赖异步数据更新UI的这种场景非常常见，因此Flutter专门提供了FutureBuilder和StreamBuilder两个组件来快速实现这种功能。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("FutureBuilder", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("FutureBuilder会依赖一个Future，它会根据所依赖的Future的状态来动态构建自身。我们看一下FutureBuilder构造函数："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""FutureBuilder({
  this.future,
  this.initialData,
  required this.builder,
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.future：FutureBuilder依赖的Future，通常是一个异步耗时任务。
                      2.initialData：初始数据，用户设置默认数据。
                      3.builder：Widget构建器；该构建器会在Future执行的不同阶段被多次调用，构建器签名如下："""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Function (BuildContext context, AsyncSnapshot snapshot) "),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("snapshot会包含当前异步任务的状态信息及结果信息 ，比如我们可以通过snapshot.connectionState获取异步任务的状态信息、通过snapshot.hasError判断异步任务是否有错误等等，完整的定义读者可以查看AsyncSnapshot类定义。另外，FutureBuilder的builder函数签名和StreamBuilder的builder是相同的。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.pushNamed(context, FutureBuilderSample.route);
                      },
                      child: textcontainer("FutureBuilder示例", ),),
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("StreamBuilder", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们知道，在Dart中Stream 也是用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果，它常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。StreamBuilder正是用于配合Stream来展示流上事件（数据）变化的UI组件。下面看一下StreamBuilder的默认构造函数"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""StreamBuilder({
  this.initialData,
  Stream<T> stream,
  required this.builder,
}) """),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("可以看到和FutureBuilder的构造函数只有一点不同：前者需要一个future，而后者需要一个stream。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.pushNamed(context, StreamBuilderSample.route);
                      },
                        child: textcontainer("StreamBuilder示例", ),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FutureBuilderSample extends StatelessWidget {
  const FutureBuilderSample({Key? key}) : super(key: key);

  static const String route = "futurebuildersample";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FutureBuilder 示例"),
      ),
      body: Center(
        child: FutureBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            if(snapshot.hasError) {
              return Text("Error : ${snapshot.error}");
            } else {
              return Text("Contents : ${snapshot.data}");
            }
          } else {
            return const CircularProgressIndicator();
          }
        },future: mockNetworkData(),),
      ),
    );
  }

  Future<String> mockNetworkData() {
    return Future.delayed(Duration(seconds: 2), () => "远程数据。。。。。。");
  }

}

class StreamBuilderSample extends StatelessWidget {
  const StreamBuilderSample({Key? key}) : super(key: key);

  static const String route = "streambuildersample";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if(snapshot.hasError) {
        return Text("Error : ${snapshot.error}");
      }
      switch(snapshot.connectionState) {
        case ConnectionState.none:
          return const Text("没有 Stream");
        case ConnectionState.waiting:
          return const Text("等待数据...'");
        case ConnectionState.active:
          return Text("active: ${snapshot.data}");
        case ConnectionState.done:
          return const Text('Stream 已关闭');
      }

    },
    stream: counter(),);
  }

  Stream<int> counter() {
    return Stream.periodic(const Duration(seconds: 1), (i) {
      return i;
    });
  }

}
