import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';
import 'functinal_widget_inheritedwidget_sample.dart';

class FunctionalWidgetInheritedWidget extends StatefulWidget {
  const FunctionalWidgetInheritedWidget({Key? key}) : super(key: key);
  static const String route = "functionalwidgetinheritedwidget";

  @override
  State<StatefulWidget> createState() {
    return FunctionalWidgetInheritedWidgetState();
  }
}

class FunctionalWidgetInheritedWidgetState extends State<FunctionalWidgetInheritedWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
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
                        child: const Text("简介", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("InheritedWidget是 Flutter 中非常重要的一个功能型组件，它提供了一种在 widget 树中从上到下共享数据的方式，比如我们在应用的根 widget 中通过InheritedWidget共享了一个数据，那么我们便可以在任意子widget 中来获取该共享的数据！这个特性在一些需要在整个 widget 树中共享数据的场景中非常方便！如Flutter SDK中正是通过 InheritedWidget 来共享应用主题（Theme）和 Locale (当前语言环境)信息的。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.all(10),
                        child: const Text("InheritedWidget和 React 中的 context 功能类似，和逐级传递数据相比，它们能实现组件跨级传递数据。InheritedWidget的在 widget 树中数据传递方向是从上到下的，这和通知Notification（将在下一章中介绍）的传递方向正好相反。"),
                      ),
                      titleWidget(context, "共享数据 --- 共享计数器示例", 0, _onPress),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("didChangeDependencies", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("在之前介绍StatefulWidget时，我们提到State对象有一个didChangeDependencies回调，它会在“依赖”发生变化时被Flutter 框架调用。而这个“依赖”指的就是子 widget 是否使用了父 widget 中InheritedWidget的数据！如果使用了，则代表子 widget 有依赖；如果没有使用则代表没有依赖。这种机制可以使子组件在所依赖的InheritedWidget变化时来更新自身！比如当主题、locale(语言)等发生变化时，依赖其的子 widget 的didChangeDependencies方法将会被调用"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("应该在didChangeDependencies()中做什么？", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("一般来说，子 widget 很少会重写此方法，因为在依赖改变后 Flutter 框架也都会调用build()方法重新构建组件树。但是，如果你需要在依赖改变后执行一些耗时的操作，比如网络请求，这时最好的方式就是在此方法中执行，这样可以避免每次build()都执行这些耗时操作。"),
                      )
                    ],
                  )),
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("现在来思考一下，在上面的例子中，如果我们只想在__TestWidgetState中引用ShareDataWidget数据，但却不希望在ShareDataWidget发生变化时调用__TestWidgetState的didChangeDependencies()方法应该怎么办？其实答案很简单，我们只需要将ShareDataWidget.of()的实现改一下即可"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""//定义一个便捷方法，方便子树中的widget获取共享数据
static ShareDataWidget of(BuildContext context) {
  //return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  return context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget;
}"""),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("唯一的改动就是获取ShareDataWidget对象的方式，把dependOnInheritedWidgetOfExactType()方法换成了context.getElementForInheritedWidgetOfExactType<ShareDataWidget>().widget，那么他们到底有什么区别呢，我们看一下这两个方法的源码（实现代码在Element类中，Context和Element的关系我们将在后面专门介绍）："),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""@override
InheritedElement getElementForInheritedWidgetOfExactType<T extends InheritedWidget>() {
  final InheritedElement ancestor = _inheritedWidgets == null ? null : _inheritedWidgets[T];
  return ancestor;
}
@override
InheritedWidget dependOnInheritedWidgetOfExactType({ Object aspect }) {
  assert(_debugCheckStateIsActiveForAncestorLookup());
  final InheritedElement ancestor = _inheritedWidgets == null ? null : _inheritedWidgets[T];
  //多出的部分
  if (ancestor != null) {
    return dependOnInheritedElement(ancestor, aspect: aspect) as T;
  }
  _hadUnsatisfiedDependencies = true;
  return null;
}"""),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们可以看到，dependOnInheritedWidgetOfExactType() 比 getElementForInheritedWidgetOfExactType()多调了dependOnInheritedElement方法，dependOnInheritedElement源码如下："),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("可以看到dependOnInheritedElement方法中主要是注册了依赖关系！看到这里也就清晰了，调用dependOnInheritedWidgetOfExactType() 和 getElementForInheritedWidgetOfExactType()的区别就是前者会注册依赖关系，而后者不会，所以在调用dependOnInheritedWidgetOfExactType()时，InheritedWidget和依赖它的子孙组件关系便完成了注册，之后当InheritedWidget发生变化时，就会更新依赖它的子孙组件，也就是会调这些子孙组件的didChangeDependencies()方法和build()方法。而当调用的是 getElementForInheritedWidgetOfExactType()时，由于没有注册依赖关系，所以之后当InheritedWidget发生变化时，就不会更新相应的子孙Widget。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text('注意，如果将上面示例中ShareDataWidget.of()方法实现改成调用getElementForInheritedWidgetOfExactType()，运行示例后，点击"Increment"按钮，会发现__TestWidgetState的didChangeDependencies()方法确实不会再被调用，但是其build()仍然会被调用！造成这个的原因其实是，点击"Increment"按钮后，会调用_InheritedWidgetTestRouteState的setState()方法，此时会重新构建整个页面，由于示例中，__TestWidget 并没有任何缓存，所以它也都会被重新构建，所以也会调用build()方法。'),
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

  _onPress(BuildContext context, int i) {
    String? route;
    switch(i) {
      case 0:
        route = FunctionalWidgetInheritedSampleWidget.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, route!);
    };
  }
}
