
import 'package:flutter/cupertino.dart';
// class ChangeNotifier implements Listenable {
//   List listeners = [];
//
//   @override
//   void addListener(VoidCallback listener) {
//     listeners.add(listener);
//   }
//
//   @override
//   void removeListener(VoidCallback listener) {
//     listeners.remove(listener);
//   }
//
//   void notify() {
//     listeners.forEach((element) => element());
//   }
// }

// 一个通用的InheritedWidget，保存需要跨组件共享的状态
class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({required this.data, required Widget child}) : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

}

//在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key? key, required this.data, required this.child});

  final T data;
  final Widget child;

  //定义一个便捷方法，方便子树中的widget获取共享数据,优化前
  // static T of<T>(BuildContext context) {
  //   // final type = _typeOf<InheritedProvider<T>>();
  //   final provider =  context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
  //   return provider!.data;
  // }

  //定义一个便捷方法，方便子树中的widget获取共享数据,优化后
  static T of<T>(BuildContext context, {bool listen = true}) {
    // final type = _typeOf<InheritedProvider<T>>();
    final provider = listen ? context.dependOnInheritedWidgetOfExactType<
        InheritedProvider<T>>() : context
        .getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()
        ?.widget as InheritedProvider<T>;
    return provider!.data;
  }
  @override
  _ChangeNotifierProviderState<T> createState() => _ChangeNotifierProviderState<T>();
}

class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider<T>> {
  void update() {
    setState(() {

    });
  }

  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<T> oldWidget) {
    if(widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(data: widget.data, child: widget.child,);
  }

}

class Consumer<T> extends StatelessWidget {
  const Consumer({Key? key, required this.builder}) : super(key: key);

  final Widget Function(BuildContext context, T? value) builder;

  @override
  Widget build(BuildContext context) {
      return builder(context, ChangeNotifierProvider.of<T>(context));
  }

}


