import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class AnimatedSwitcherSample extends StatelessWidget {
  const AnimatedSwitcherSample({Key? key}) : super(key: key);

  static const String route = "animatedswitchersample";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画切换组件（AnimatedSwitcher）"),
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
                        "实际开发中，我们经常会遇到切换UI元素的场景，比如Tab切换、路由切换。为了增强用户体验，通常在切换时都会指定一个动画，以使切换过程显得平滑。Flutter SDK组件库中已经提供了一些常用的切换组件，如PageView、TabView等，但是，这些组件并不能覆盖全部的需求场景，为此，Flutter SDK中提供了一个AnimatedSwitcher组件，它定义了一种通用的UI切换抽象。"),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "AnimatedSwitcher",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "1. 简介",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "AnimatedSwitcher 可以同时对其新、旧子元素添加显示、隐藏动画。也就是说在AnimatedSwitcher的子元素发生变化时，会对其旧元素和新元素做动画，我们先看看AnimatedSwitcher 的定义："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const AnimatedSwitcher({
  Key? key,
  this.child,
  required this.duration, // 新child显示动画时长
  this.reverseDuration,// 旧child隐藏的动画时长
  this.switchInCurve = Curves.linear, // 新child显示的动画曲线
  this.switchOutCurve = Curves.linear,// 旧child隐藏的动画曲线
  this.transitionBuilder = AnimatedSwitcher.defaultTransitionBuilder, // 动画构建器
  this.layoutBuilder = AnimatedSwitcher.defaultLayoutBuilder, //布局构建器
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "当AnimatedSwitcher的 child 发生变化时（类型或 Key 不同），旧 child 会执行隐藏动画，新 child 会执行执行显示动画。究竟执行何种动画效果则由transitionBuilder参数决定，该参数接受一个AnimatedSwitcherTransitionBuilder类型的 builder，定义如下："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """typedef AnimatedSwitcherTransitionBuilder =
  Widget Function(Widget child, Animation<double> animation);"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "该builder在AnimatedSwitcher的child切换时会分别对新、旧child绑定动画："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.对旧child，绑定的动画会反向执行（reverse）
2.对新child，绑定的动画会正向指向（forward）"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "这样一下，便实现了对新、旧child的动画绑定。AnimatedSwitcher的默认值是AnimatedSwitcher.defaultTransitionBuilder ："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          """Widget defaultTransitionBuilder(Widget child, Animation<double> animation) {
  return FadeTransition(
    opacity: animation,
    child: child,
  );
}"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                          "可以看到，返回了FadeTransition对象，也就是说默认情况，AnimatedSwitcher会对新旧child执行“渐隐”和“渐显”动画。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(AnimatedSwitcherCounterRoute.route);
                        },
                        child: textcontainer("示例"),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("AnimatedSwitcher实现原理", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("实际上，AnimatedSwitcher的实现原理是比较简单的，我们根据AnimatedSwitcher的使用方式也可以猜个大概。要想实现新旧 child 切换动画，只需要明确两个问题："),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.动画执行的时机是什么时候？
2.如何对新旧child执行动画？"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("从AnimatedSwitcher的使用方式我们可以看到：当child发生变化时（子 widget 的 key 或类型不同时则认为发生变化），则重新会重新执行build，然后动画开始执行。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们可以通过继承 StatefulWidget 来实现AnimatedSwitcher，具体做法是在didUpdateWidget 回调中判断其新旧 child 是否发生变化，如果发生变化，则对旧 child 执行反向退场（reverse）动画，对新child执行正向（forward）入场动画即可。下面是AnimatedSwitcher实现的部分核心伪代码："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""Widget _widget; 
void didUpdateWidget(AnimatedSwitcher oldWidget) {
  super.didUpdateWidget(oldWidget);
  // 检查新旧child是否发生变化(key和类型同时相等则返回true，认为没变化)
  if (Widget.canUpdate(widget.child, oldWidget.child)) {
    // child没变化，...
  } else {
    //child发生了变化，构建一个Stack来分别给新旧child执行动画
   _widget= Stack(
      alignment: Alignment.center,
      children:[
        //旧child应用FadeTransition
        FadeTransition(
         opacity: _controllerOldAnimation,
         child : oldWidget.child,
        ),
        //新child应用FadeTransition
        FadeTransition(
         opacity: _controllerNewAnimation,
         child : widget.child,
        ),
      ]
    );
    // 给旧child执行反向退场动画
    _controllerOldAnimation.reverse();
    //给新child执行正向入场动画
    _controllerNewAnimation.forward();
  }
}

//build方法
Widget build(BuildContext context){
  return _widget;
}"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上面伪代码展示了AnimatedSwitcher实现的核心逻辑，当然AnimatedSwitcher真正的实现比这个复杂，它可以自定义进退场过渡动画以及执行动画时的布局等。在此，我们删繁就简，通过伪代码形式让读者能够清楚看到主要的实现思路，具体的实现读者可以参考AnimatedSwitcher源码。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("另外，Flutter SDK中还提供了一个AnimatedCrossFade组件，它也可以切换两个子元素，切换过程执行渐隐渐显的动画，和AnimatedSwitcher不同的是AnimatedCrossFade是针对两个子元素，而AnimatedSwitcher是在一个子元素的新旧值之间切换。AnimatedCrossFade实现原理也比较简单，和AnimatedSwitcher类似，因此不再赘述，读者有兴趣可以查看其源码"),
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
                      child: const Text("AnimatedSwitcher高级用法", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("自定义动画，打破AnimatedSwitcher 进场/出场动画对称播放"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(SlideTransitionSample.route);
                      }, child: textcontainer("示例"),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上图中“0”从左侧滑出，而“1”从右侧滑入。可以看到，我们通过这种巧妙的方式实现了类似路由进场切换的动画，实际上Flutter路由切换也正是通过AnimatedSwitcher来实现的。"),
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
                      child: const Text("SlideTransitionX", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上面的示例我们实现了“左出右入”的动画，那如果要实现“左入右出”、“上入下出”或者 “下入上出”怎么办？当然，我们可以分别修改上面的代码，但是这样每种动画都得单独定义一个“Transition”，这很麻烦。本节将封装一个通用的SlideTransitionX 来实现这种“出入动画”."),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(SlideTransitionXSample.route);
                      }, child: textcontainer("示例"),),
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

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key? key}) : super(key: key);

  static const String route = "AnimatedSwitcherCounterRoute";

  @override
  State<StatefulWidget> createState() {
    return _AnimatedSwitcherCounterState();
  }
}

class _AnimatedSwitcherCounterState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("计数器示例"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                key: ValueKey<int>(_count),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: textcontainer("+1"),
            )
          ],
        ),
      ),
    );
  }
}

class MySlideTransiton extends AnimatedWidget {
  const MySlideTransiton({Key? key, required Animation<Offset> position, this.transformHitTests = true, required this.child}) : super(key: key, listenable: position);

  final bool transformHitTests;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if(position.status == AnimationStatus.reverse){
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(translation: offset, transformHitTests: transformHitTests, child: child,);
  }
}

class SlideTransitionSample extends StatefulWidget {
  const SlideTransitionSample({Key? key}) : super(key: key);

  static const String route = "SlideTransitionSample";

  @override
  State<StatefulWidget> createState() {
    return _SlideTransitionSampleState();
  }
}

class _SlideTransitionSampleState extends State<SlideTransitionSample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("自定义SlideTransition"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
                return MySlideTransiton(child: child, position: tween.animate(animation));
              },
              child: Text(
                '$_count',
                key: ValueKey<int>(_count),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
              child: textcontainer("+1"),
            )
          ],
        ),
      ),
    );
  }
}

class SlideTransitionX extends AnimatedWidget {
   SlideTransitionX({
    Key? key,
    required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    required this.child
  }) : super(key: key, listenable: position) {
    switch(direction) {
      case AxisDirection.up:
        _tween = Tween(begin: const Offset(0, 1), end: const Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: const Offset(-1, 0), end: const Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: const Offset(0, -1), end: const Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
        break;
    }
  }

  final bool transformHitTests;

  final Widget child;

  final AxisDirection direction;

  late final Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<double>;
    Offset offset = _tween.evaluate(position);
    if(position.status == AnimationStatus.reverse) {
      switch(direction) {
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
      }
    }
    return FractionalTranslation(translation: offset, transformHitTests: transformHitTests, child: child,);
  }
}

class SlideTransitionXSample extends StatefulWidget {
  const SlideTransitionXSample({Key? key}) : super(key: key);

  static const String route = "SlideTransitionXSample";

  @override
  State<StatefulWidget> createState() {
    return _SlideTransitionXSampleState();
  }
}

class _SlideTransitionXSampleState extends State<SlideTransitionXSample> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation) {
              var tween = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
              return SlideTransitionX(child: child, position: animation, direction: AxisDirection.down,);
            },
            child: Text(
              '$_count',
              key: ValueKey<int>(_count),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _count += 1;
              });
            },
            child: textcontainer("+1"),
          )
        ],
      ),
    );
  }

}
