

import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

import 'Interleave_animation.dart';
import 'animated_switcher.dart';
import 'animation_transition_components.dart';
import 'animation_widget_introduce.dart';
import 'basic_structure_of_animation.dart';
import 'custom_route_switch_animation.dart';
import 'hero_animation.dart';

class AnimationWidget extends StatelessWidget {
  const AnimationWidget({Key? key}) : super(key: key);

  static const String route = "animationwidget";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleWidget(context, "Flutter 动画简介", 0, _onTap),
              titleWidget(context, "动画基本结构及状态监听", 1, _onTap),
              titleWidget(context, "自定义路由切换动画", 2, _onTap),
              titleWidget(context, "Hero动画", 3, _onTap),
              titleWidget(context, "交织动画", 4, _onTap),
              titleWidget(context, "动画切换组件（AnimatedSwitcher）", 5, _onTap),
              titleWidget(context, "动画过渡组件", 6, _onTap)
            ],
          ),
        ),
      ),
    );
  }


  _onTap(BuildContext context, int i) {
    String? route;
    switch(i) {
      case 0:
        route = AnimationWidgetIntroduce.route;
        break;
      case 1:
        route = BasicStructureOfAnimation.route;
        break;
      case 2:
        route = CustomRouteSwitchAnimation.route;
        break;
      case 3:
        route = HeroAnimation.route;
        break;
      case 4:
        route = InterleaveAnimation.route;
        break;
      case 5:
        route = AnimatedSwitcherSample.route;
        break;
      case 6:
        route = AnimationTransitionComponents.route;
        break;
    }
    return () {
      Navigator.of(context).pushNamed(route!);
    };
  }
}
