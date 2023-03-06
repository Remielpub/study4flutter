

import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class TurnBoxSample extends StatelessWidget {
  const TurnBoxSample({Key? key}) : super(key: key);

  static const String route = "TurnBoxSample";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("组合实例：TurnBox"),
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
                      child: const Text("我们之前已经介绍过RotatedBox，它可以旋转子组件，但是它有两个缺点：一是只能将其子节点以90度的倍数旋转；二是当旋转的角度发生变化时，旋转角度更新过程没有动画。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("本节我们将实现一个TurnBox组件，它不仅可以以任意角度来旋转其子节点，而且可以在角度发生变化时执行一个动画以过渡到新状态，同时，我们可以手动指定动画速度。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: ElevatedButton(onPressed: () {
                        Navigator.of(context).pushNamed(TurnBoxRoute.route);
                      }, child: textcontainer("示例"),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("当我们点击旋转按钮时，两个图标的旋转都会旋转1/5圈，但旋转的速度是不同的，可以自己运行一下示例看看效果。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(""),
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

class TurnBox extends StatefulWidget {
  const TurnBox({
    Key? key,
    this.turns = .0,  //旋转的“圈”数,一圈为360度，如0.25圈即90度
    this.speed = 200, //过渡动画执行的总时长
    required this.child
  }) : super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _TurnBoxState();
  }
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, lowerBound: -double.infinity, upperBound: double.infinity);
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RotationTransition(turns: _controller, child: widget.child,);
  }

  @override
  void didUpdateWidget(covariant TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns,
          duration: Duration(milliseconds: widget.speed ?? 200),
          curve: Curves.easeOut);
    }
  }
}

class TurnBoxRoute extends StatefulWidget {
  const TurnBoxRoute({Key? key}) : super(key: key);

  static const String route = "TurnBoxRoute";

  @override
  State<StatefulWidget> createState() {
    return _TurnBoxRouteState();
  }
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TurnBox"),
      ),
      body: Column(
        children: [
          TurnBox(child: const Icon(Icons.refresh, size: 50,), turns: _turns, speed: 500,),

          TurnBox(child: const Icon(Icons.refresh, size: 100,), turns: _turns, speed: 1000,),

          ElevatedButton(onPressed: () {
            setState(() {
              _turns += .2;
            });
          }, child: const Text("顺时针旋转1/5圈")),

          ElevatedButton(onPressed: () {
            setState(() {
              _turns -= .2;
            });
          }, child: const Text("逆时针旋转1/5圈")),
        ],
      ),
    );
  }

}
