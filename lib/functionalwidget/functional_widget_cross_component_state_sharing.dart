import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

import 'functinal_widget_inheritedwidget_shopping_sample.dart';

class FunctionalWidgetCrollComponentStateSharing extends StatefulWidget {
  const FunctionalWidgetCrollComponentStateSharing({Key? key})
      : super(key: key);

  static const String route = "functionalwidgetcrollcomponentstatesharing";

  @override
  State<StatefulWidget> createState() {
    return FunctionalWidgetCrollComponentStateSharingState();
  }
}

class FunctionalWidgetCrollComponentStateSharingState
    extends State<FunctionalWidgetCrollComponentStateSharing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("跨组件状态共享"),
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
                      const Text(
                          "在Flutter当中有没有更好的跨组件状态管理方式了呢？答案是肯定的，那怎么做的？我们想想前面介绍的InheritedWidget，它的天生特性就是能绑定InheritedWidget与依赖它的子孙组件的依赖关系，并且当InheritedWidget数据发生变化时，可以自动更新依赖的子孙组件！利用这个特性，我们可以将需要跨组件共享的状态保存在InheritedWidget中，然后在子组件中引用InheritedWidget即可，Flutter社区著名的Provider包正是基于这个思想实现的一套跨组件状态共享解决方案，接下来我们便详细介绍一下Provider的用法及原理。"),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "Provider",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "Provider是Flutter官方出的状态管理包，为了加强读者对其原理的理解，我们不直接去看Provider包的源代码，相反，我会带着你根据上面描述的通过InheritedWidget实现的思路来一步一步地实现一个最小功能的Provider。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "首先，我们需要一个保存需要共享的数据InheritedWidget，由于具体业务数据类型不可预期，为了通用性，我们使用泛型，定义一个通用的InheritedProvider类，它继承自InheritedWidget："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child:
                            const Text("""// 一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({
    required this.data,
    required Widget child,
  }) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "数据保存的地方有了，那么接下来我们需要做的就是在数据发生变化的时候来重新构建InheritedProvider，那么现在就面临两个问题："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""1.数据发生变化怎么通知？
2.谁来重新构建InheritedProvider？"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "第一个问题其实很好解决，我们当然可以使用之前介绍的eventBus来进行事件通知，但是为了更贴近Flutter开发，我们使用Flutter SDK中提供的ChangeNotifier类 ，它继承自Listenable，也实现了一个Flutter风格的发布者-订阅者模式，ChangeNotifier定义大致如下"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """class ChangeNotifier implements Listenable {
  List listeners=[];
  @override
  void addListener(VoidCallback listener) {
     //添加监听器
     listeners.add(listener);
  }
  @override
  void removeListener(VoidCallback listener) {
    //移除监听器
    listeners.remove(listener);
  }
  
  void notifyListeners() {
    //通知所有监听器，触发监听器回调 
    listeners.forEach((item)=>item());
  }
   
  ... //省略无关代码
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "我们可以通过调用addListener()和removeListener()来添加、移除监听器（订阅者）；通过调用notifyListeners() 可以触发所有监听器回调。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "现在，我们将要共享的状态放到一个Model类中，然后让它继承自ChangeNotifier，这样当共享的状态改变时，我们只需要调用notifyListeners() 来通知订阅者，然后由订阅者来重新构建InheritedProvider，这也是第二个问题的答案！接下来我们便实现这个订阅者类："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({
    Key? key,
    this.data,
    this.child,
  });

  final Widget child;
  final T data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static T of<T>(BuildContext context) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider =  context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "该类继承StatefulWidget，然后定义了一个of()静态方法供子类方便获取Widget树中的InheritedProvider中保存的共享状态(model)，下面我们实现该类对应的_ChangeNotifierProviderState类："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void update() {
    //如果数据发生变化（model类调用了notifyListeners），重新构建InheritedProvider
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    //当Provider更新时，如果新旧数据不"=="，则解绑旧数据监听，同时添加新数据监听
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    // 给model添加监听器
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    // 移除model的监听器
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "可以看到_ChangeNotifierProviderState类的主要作用就是监听到共享状态（model）改变时重新构建Widget树。注意，在_ChangeNotifierProviderState类中调用setState()方法，widget.child始终是同一个，所以执行build时，InheritedProvider的child引用的始终是同一个子widget，所以widget.child并不会重新build，这也就相当于对child进行了缓存！当然如果ChangeNotifierProvider父级Widget重新build时，则其传入的child便有可能会发生变化。"),
                      ),
                      titleWidget(context, "购物车示例", 0, _onPress),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "每次点击”添加商品“按钮，总价就会增加20，我们期望的功能实现了！可能有些读者会疑惑，我们饶了一大圈实现这么简单的功能有意义么？其实，就这个例子来看，只是更新同一个路由页中的一个状态，我们使用ChangeNotifierProvider的优势并不明显，但是如果我们是做一个购物APP呢？由于购物车数据是通常是会在整个APP中共享的，比如会跨路由共享。如果我们将ChangeNotifierProvider放在整个应用的Widget树的根上，那么整个APP就可以共享购物车的数据了，这时ChangeNotifierProvider的优势将会非常明显。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "虽然上面的例子比较简单，但它却将Provider的原理和流程体现的很清楚，图7-3是Provider的原理图："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Image.asset("assets/20230222114440.jpg"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "Model变化后会自动通知ChangeNotifierProvider（订阅者），ChangeNotifierProvider内部会重新构建InheritedWidget，而依赖该InheritedWidget的子孙Widget就会更新。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """我们的业务代码更关注数据了，只要更新Model，则UI会自动更新，而不用在状态改变后再去手动调用setState()来显式更新页面。
数据改变的消息传递被屏蔽了，我们无需手动去处理状态改变事件的发布和订阅了，这一切都被封装在Provider中了。这真的很棒，帮我们省掉了大量的工作！
在大型复杂应用中，尤其是需要全局共享的状态非常多时，使用Provider将会大大简化我们的代码逻辑，降低出错的概率，提高开发效率。"""),
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
                      child: const Text(
                        "优化",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们先看一下构建显示总价Text的代码："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""Builder(builder: (context){
  var cart=ChangeNotifierProvider.of<CartModel>(context);
  return Text('');
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("这段代码有两点可以优化："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                          """1.需要显式调用ChangeNotifierProvider.of，当APP内部依赖CartModel很多时，这样的代码将很冗余。
2.语义不明确；由于ChangeNotifierProvider是订阅者，那么依赖CartModel的Widget自然就是订阅者，其实也就是状态的消费者，如果我们用Builder 来构建，语义就不是很明确；如果我们能使用一个具有明确语义的Widget，比如就叫Consumer，这样最终的代码语义将会很明确，只要看到Consumer，我们就知道它是依赖某个跨组件或全局的状态。"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child:
                          const Text("为了优化这两个问题，我们可以封装一个Consumer Widget，实现如下："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child:
                          const Text("""// 这是一个便捷类，会获得当前context和指定数据类型的Provider
class Consumer<T> extends StatelessWidget {
  Consumer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "Consumer实现非常简单，它通过指定模板参数，然后再内部自动调用ChangeNotifierProvider.of获取相应的Model，并且Consumer这个名字本身也是具有确切语义（消费者）。现在上面的代码块可以优化为如下这样："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""Consumer<CartModel>(
                          builder: (context, cart)=> Text('总价:');
              )"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "如何避免这不必要重构呢？既然按钮重新被build是因为按钮和InheritedWidget建立了依赖关系，那么我们只要打破或解除这种依赖关系就可以了。那么如何解除按钮和InheritedWidget的依赖关系呢？我们上一节介绍InheritedWidget时已经讲过了：调用dependOnInheritedWidgetOfExactType() 和 getElementForInheritedWidgetOfExactType()的区别就是前者会注册依赖关系，而后者不会。所以我们只需要将ChangeNotifierProvider.of的实现改为下面这样即可："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""//添加一个listen参数，表示是否建立依赖关系
  static T of<T>(BuildContext context, {bool listen = true}) {
    final type = _typeOf<InheritedProvider<T>>();
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>()
        : context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()?.widget
            as InheritedProvider<T>;
    return provider.data;
  }"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "修改后再次运行上面的示例，我们会发现点击”添加商品“按钮后，控制台不会再输出 ElevatedButton build了，即按钮不会被重新构建了。而总价仍然会更新，这是因为Consumer中调用ChangeNotifierProvider.of时listen值为默认值true，所以还是会建立依赖关系。"),
                    ),
                    titleWidget(context, "购物车示例2", 1, _onPress)
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
    String? routeName;
    switch (i) {
      case 0:
        routeName = ShoppingSample.route;
        break;
      case 1:
        routeName = ShoppingSample2.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routeName!);
    };
  }
}
