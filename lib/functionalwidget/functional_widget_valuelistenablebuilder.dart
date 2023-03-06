import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class FunctionalWidgetValueListenableBuilder extends StatelessWidget {
  const FunctionalWidgetValueListenableBuilder({Key? key}) : super(key: key);

  static const String route = "functionalwidgetvaluelistenablebuilder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("按需rebuild（ValueListenableBuilder）"),
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
                      child: const Text(
                        "ValueListenableBuilder",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "InheritedWidget 提供一种在 widget 树中从上到下共享数据的方式，但是也有很多场景数据流向并非从上到下，比如从下到上或者横向等。为了解决这个问题，Flutter 提供了一个 ValueListenableBuilder 组件，它的功能是监听一个数据源，如果数据源发生变化，则会重新执行其 builder，定义如下:"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const ValueListenableBuilder({
  Key? key,
  required this.valueListenable, // 数据源，类型为ValueListenable<T>
  required this.builder, // builder
  this.child,
}"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """valueListenable：类型为 ValueListenable<T>，表示一个可监听的数据源。
builder：数据源发生变化通知时，会重新调用 builder 重新 build 子组件树。
child: builder 中每次都会重新构建整个子组件树，如果子组件树中有一些不变的部分，可以传递给child，child 会作为builder的第三个参数传递给 builder，通过这种方式就可以实现组件缓存，原理和AnimatedBuilder 第三个 child 相同。"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "可以发现 ValueListenableBuilder 和数据流向是无关的，只要数据源发生变化它就会重新构建子组件树，因此可以实现任意流向的数据共享。"),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, ValueListenableBuilderSample.route);
                        },
                        child: textcontainer("示例"),
                      ),

                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("可以看见，功能正常实现了，同时控制台只在页面打开时 build 了一次，点击 + 按钮的时候只是ValueListenableBuilder 重新构建了子组件树，而整个页面并没有重新 build ，因此日志面板只打印了一次 build 。因此我们有一个建议就是：尽可能让 ValueListenableBuilder 只构建依赖数据源的widget，这样的话可以缩小重新构建的范围，也就是说 ValueListenableBuilder 的拆分粒度应该尽可能细。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("总结", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.和数据流向无关，可以实现任意流向的数据共享。
2.实践中，ValueListenableBuilder 的拆分粒度应该尽可能细，可以提高性能。"""),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class ValueListenableBuilderSample extends StatefulWidget {
  static const String route = "valuelistenablebuildersample";

  const ValueListenableBuilderSample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ValueListenableBuilderSampleState();
  }
}

class _ValueListenableBuilderSampleState
    extends State<ValueListenableBuilderSample> {
  final ValueNotifier<int> _counter = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    print("ValueListenableBuilderSample build");
    return Scaffold(
      appBar: AppBar(title: const Text('ValueListenableBuilder 测试')),
      body: Center(
        child: ValueListenableBuilder(
          builder: (BuildContext context, value, Widget? child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                child!,
                Text(
                  '$value 次',
                  textScaleFactor: 1.5,
                )
              ],
            );
          },
          valueListenable: _counter,
          child: const Text(
            '点击了',
            textScaleFactor: 1.5,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value += 1;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
