
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/custom_element/principles_of_gesture_recognition.dart';
import 'package:flutter_demo/eventandnotification/event_bus_sample.dart';
import 'package:flutter_demo/eventandnotification/flutter_event_mechanism.dart';
import 'package:flutter_demo/utils/widget_util.dart';

import '../functionalwidget/functional_widget_notification.dart';
import 'event_gesture.dart';
import 'original_point_event.dart';

class EventAndNotificationRoutePager extends StatelessWidget {
  const EventAndNotificationRoutePager({Key? key}) : super(key: key);

  static const String route = "event_and_notification_route_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("事件处理与通知"),
      ),
      body:  Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text("Flutter中的手势系统有两个独立的层。第一层为原始指针(pointer)事件，它描述了屏幕上指针（例如，触摸、鼠标和触控笔）的位置和移动。 第二层为手势，描述由一个或多个指针移动组成的语义动作，如拖动、缩放、双击等。本章将先分别介绍如何处理这两种事件，最后再介绍一下Flutter中重要的Notification机制。"),
                    titleWidget(context, "原始指针事件处理", 0, _onPress),
                    titleWidget(context, "手势识别", 1, _onPress),
                    titleWidget(context, "Flutter事件机制", 2, _onPress),
                    titleWidget(context, "手势原理与手势冲突", 3, _onPress),
                    titleWidget(context, "全局事件总线", 4, _onPress),
                    titleWidget(context, "通知(Notification)", 5, _onPress),
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
        route = OriginalPointEventHandle.route;
        break;
      case 1:
        route = EventGesture.route;
        break;
      case 2:
        route = FlutterEventMechanism.route;
        break;
      case 3:
        route = PrinciplesOfGestureRecognition.route;
        break;
      case 4:
        route = EventBusSmaple.route;
        break;
      case 5:
        route = FunctionalWidgetNotification.route;
        break;
    }
    return () {
      Navigator.of(context).pushNamed(route!);
    };
  }
}
