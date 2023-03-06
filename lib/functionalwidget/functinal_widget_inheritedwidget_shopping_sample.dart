import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/change_notifier_provider.dart';

class ShoppingSample extends StatefulWidget {
  const ShoppingSample({Key? key}) : super(key: key);
  static const String route = "shoppingsample";

  @override
  State<StatefulWidget> createState() {
    return ShoppingSampleState();
  }
}

class ShoppingSampleState extends State<ShoppingSample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InheritedWidget"),
      ),
      body: Center(
        child: ChangeNotifierProvider<CarModel>(
          data: CarModel(),
          child: Builder(builder: (BuildContext context) {
            return Column(
              children: [
                Builder(builder: (BuildContext context) {
                  var car = ChangeNotifierProvider.of<CarModel>(context);
                  return Text("总价：${car.totalPrice}");
                },),
                Builder(builder: (BuildContext context) {
                  print("ElevatedButton build");
                  return ElevatedButton(onPressed: () {
                    ChangeNotifierProvider.of<CarModel>(context).add(Item(20.0, 1));
                  }, child: Text("添加商品"),);
                },)
              ],
            );
          },),
        ),
      )
    );
  }
}

class ShoppingSample2 extends StatefulWidget {
  const ShoppingSample2({Key? key}) : super(key: key);
  static const String route = "shoppingsample2";

  @override
  State<StatefulWidget> createState() {
    return ShoppingSampleState2();
  }
}

class ShoppingSampleState2 extends State<ShoppingSample2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("InheritedWidget"),
        ),
        body: Center(
          child: ChangeNotifierProvider<CarModel>(
            data: CarModel(),
            child: Builder(builder: (BuildContext context) {
              return Column(
                children: [
                  Consumer<CarModel>(builder: (BuildContext context, value) {
                    return Text("总价：${value!.totalPrice}");
                  },),
                  Builder(builder: (BuildContext context) {
                    print("ElevatedButton build");
                    return ElevatedButton(onPressed: () {
                      ChangeNotifierProvider.of<CarModel>(context, listen: false).add(Item(20.0, 1));
                    }, child: Text("添加商品"),);
                  },)
                ],
              );
            },),
          ),
        )
    );
  }
}

class Item {
  Item(this.price, this.count);

  double price;
  int count;
}

class CarModel extends ChangeNotifier {
  // 用于保存购物车中商品列表
  final List<Item> _items = [];

  // 禁止改变购物车里的商品信息
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  // 购物车中商品的总价
  double get totalPrice => _items.fold(0, (value, item) => value + item.count * item.price);

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}
