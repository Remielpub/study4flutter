
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

import '../custom_element/event_bus.dart';

class EventBusSmaple extends StatelessWidget {
  const EventBusSmaple({Key? key}) : super(key: key);

  static const String route = "event_bus";

  @override
  Widget build(BuildContext context) {
    bus.on("event", (arg) {
      print("recieve event");
    });
    return Scaffold(
      appBar: AppBar(
        title: Text("事件总线"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text("在 App 中，我们经常会需要一个广播机制，用以跨页面事件通知，比如一个需要登录的 App 中，页面会关注用户登录或注销事件，来进行一些状态更新。这时候，一个事件总线便会非常有用，事件总线通常实现了订阅者模式，订阅者模式包含发布者和订阅者两种角色，可以通过事件总线来触发事件和监听事件，本节我们实现一个简单的全局事件总线，我们使用单例模式，代码如下："),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("事件总线通常用于组件之间状态共享，但关于组件之间状态共享也有一些专门的包如redux、mobx以及前面介绍过的Provider。对于一些简单的应用，事件总线是足以满足业务需求的，如果你决定使用状态管理包的话，一定要想清楚您的 App 是否真的有必要使用它，防止“化简为繁”、过度设计。"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextButton(onPressed: () {
                    bus.emit("event", "ahhahahah");
                  }, child: textcontainer("发送事件"),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
