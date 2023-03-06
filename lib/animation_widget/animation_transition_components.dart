import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class AnimationTransitionComponents extends StatelessWidget {
  const AnimationTransitionComponents({Key? key}) : super(key: key);

  static const String route = "AnimationTransitionComponents";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("动画过渡组件"),
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
                          "为了表述方便，本书约定，将在Widget属性发生变化时会执行过渡动画的组件统称为”动画过渡组件“，而动画过渡组件最明显的一个特征就是它会在内部自管理AnimationController。我们知道，为了方便使用者可以自定义动画的曲线、执行时长、方向等，在前面介绍过的动画封装方法中，通常都需要使用者自己提供一个AnimationController对象来自定义这些属性值。但是，如此一来，使用者就必须得手动管理AnimationController，这又会增加使用的复杂性。因此，如果也能将AnimationController进行封装，则会大大提高动画组件的易用性。"),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                          "自定义动画过渡组件",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "我们要实现一个AnimatedDecoratedBox，它可以在decoration属性发生变化时，从旧状态变成新状态的过程可以执行一个过渡动画"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(DecorationBoxSample.route);
                          },
                          child: textcontainer("示例"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "点击后，按钮背景色会从蓝色向红色过渡，过渡过程中的一帧，有点偏紫色，整个过渡动画结束后背景会变为红色。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "上面的代码虽然实现了我们期望的功能，但是代码却比较复杂。稍加思考后，我们就可以发现，AnimationController的管理以及Tween更新部分的代码都是可以抽象出来的，如果我们这些通用逻辑封装成基类，那么要实现动画过渡组件只需要继承这些基类，然后定制自身不同的代码（比如动画每一帧的构建方法）即可，这样将会简化代码。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "为了方便开发者来实现动画过渡组件的封装，Flutter提供了一个ImplicitlyAnimatedWidget抽象类，它继承自StatefulWidget，同时提供了一个对应的ImplicitlyAnimatedWidgetState类，AnimationController的管理就在ImplicitlyAnimatedWidgetState类中。开发者如果要封装动画，只需要分别继承ImplicitlyAnimatedWidget和ImplicitlyAnimatedWidgetState类即可，下面我们演示一下具体如何实现。"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("我们需要分两步实现："),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("1.继承ImplicitlyAnimatedWidget类。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  const AnimatedDecoratedBox({
    Key? key,
    required this.decoration,
    required this.child,
    Curve curve = Curves.linear,
    required Duration duration,
  }) : super(
          key: key,
          curve: curve,
          duration: duration,
        );
  final BoxDecoration decoration;
  final Widget child;

  @override
  _AnimatedDecoratedBoxState createState() {
    return _AnimatedDecoratedBoxState();
  }
}
"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "其中curve、duration、reverseDuration三个属性在ImplicitlyAnimatedWidget中已定义。 可以看到AnimatedDecoratedBox类和普通继承自StatefulWidget的类没有什么不同。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "2.State类继承自AnimatedWidgetBaseState（该类继承自ImplicitlyAnimatedWidgetState类）。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""class _AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  late DecorationTween _decoration;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decoration.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _decoration = visitor(
      _decoration,
      widget.decoration,
      (value) => DecorationTween(begin: value),
    ) as DecorationTween;
  }
}"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "可以看到我们实现了build和forEachTween两个方法。在动画执行过程中，每一帧都会调用build方法（调用逻辑在ImplicitlyAnimatedWidgetState中），所以在build方法中我们需要构建每一帧的DecoratedBox状态，因此得算出每一帧的decoration 状态，这个我们可以通过_decoration.evaluate(animation) 来算出，其中animation是ImplicitlyAnimatedWidgetState基类中定义的对象，_decoration是我们自定义的一个DecorationTween类型的对象，那么现在的问题就是它是在什么时候被赋值的呢？要回答这个问题，我们就得搞清楚什么时候需要对_decoration赋值。我们知道_decoration是一个Tween，而Tween的主要职责就是定义动画的起始状态（begin）和终止状态(end)。对于AnimatedDecoratedBox来说，decoration的终止状态就是用户传给它的值，而起始状态是不确定的，有以下两种情况："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            """1.AnimatedDecoratedBox首次build，此时直接将其decoration值置为起始状态，即_decoration值为DecorationTween(begin: decoration) 。
2.AnimatedDecoratedBox的decoration更新时，则起始状态为_decoration.animate(animation)，即_decoration值为DecorationTween(begin: _decoration.animate(animation)，end:decoration)。"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "现在forEachTween的作用就很明显了，它正是用于来更新Tween的初始值的，在上述两种情况下会被调用，而开发者只需重写此方法，并在此方法中更新Tween的起始状态值即可。而一些更新的逻辑被屏蔽在了visitor回调，我们只需要调用它并给它传递正确的参数即可，visitor方法签名如下"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""Tween<T> visitor(
   Tween<T> tween, //当前的tween，第一次调用为null
   T targetValue, // 终止状态
   TweenConstructor<T> constructor，//Tween构造器，在上述三种情况下会被调用以更新tween
 );"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "可以看到，通过继承ImplicitlyAnimatedWidget和ImplicitlyAnimatedWidgetState类可以快速的实现动画过渡组件的封装，这和我们纯手工实现相比，代码简化了很多"),
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
                        child: const Text(
                            "Flutter SDK中也预置了很多动画过渡组件，实现方式和大都和AnimatedDecoratedBox差不多,如图所示："),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Image.asset('assets/20230302151334.jpg'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(AnimatedWidgetsTest.route);
                          },
                          child: textcontainer("示例"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class AnimatedDecoratedBox1 extends StatefulWidget {
  const AnimatedDecoratedBox1(
      {Key? key,
      required this.decoration,
      required this.child,
      this.curve = Curves.linear,
      required this.duration,
      this.reverseDuration})
      : super(key: key);

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration? reverseDuration;

  @override
  State<StatefulWidget> createState() {
    return _AnimatedDecoratedBox1State();
  }
}

class _AnimatedDecoratedBox1State extends State<AnimatedDecoratedBox1>
    with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  late AnimationController _controller;

  Animation<double> get animation => _animation;
  late Animation<double> _animation;

  late DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: widget.duration,
        reverseDuration: widget.reverseDuration);

    _tween = DecorationTween(begin: widget.decoration);

    _updateCurve();
  }

  void _updateCurve() {
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void didUpdateWidget(covariant AnimatedDecoratedBox1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();

    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;

    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;

      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class DecorationBoxSample extends StatefulWidget {
  const DecorationBoxSample({Key? key}) : super(key: key);

  static const String route = "DecorationBoxSample";

  @override
  State<StatefulWidget> createState() {
    return _DecorationBoxSampleState();
  }
}

class _DecorationBoxSampleState extends State<DecorationBoxSample> {
  Color _decorationColor = Colors.blue;
  var duration = Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedDecoratedBox"),
      ),
      body: Center(
        child: AnimatedDecoratedBox1(
          duration: duration,
          decoration: BoxDecoration(color: _decorationColor),
          child: TextButton(
            onPressed: () {
              setState(() {
                if (_decorationColor == Colors.red) {
                  _decorationColor = Colors.blue;
                } else {
                  _decorationColor = Colors.red;
                }
              });
            },
            child: const Text(
              "AnimatedDecoratedBox",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedWidgetsTest extends StatefulWidget {
  const AnimatedWidgetsTest({Key? key}) : super(key: key);

  static const String route = 'AnimatedWidgetsTest';
  @override
  State<StatefulWidget> createState() {
    return _AnimatedWidgetsTestState();
  }
}

class _AnimatedWidgetsTestState extends State<AnimatedWidgetsTest> {
  double _padding = 0;
  var _align = Alignment.topRight;
  double _height = 100;
  double _left = 0;
  Color _color = Colors.red;

  TextStyle _style = const TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    var duration = const Duration(milliseconds: 400);
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  if(_padding == 0) {
                    _padding = 20;
                  } else {
                    _padding = 0;
                  }
                });
              },
              child: AnimatedPadding(
                padding: EdgeInsets.all(_padding),
                duration: duration,
                child: const Text("AnimatedPadding"),
              )),
          SizedBox(
            height: 50,
            child: Stack(
              children: [
                AnimatedPositioned(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if(_left == 0) {
                          _left = 100;
                        } else {
                          _left = 0;
                        }
                      });
                    },
                    child: const Text("AnimatedPositioned"),
                  ),
                  duration: duration,
                  left: _left,
                )
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.grey,
            child: AnimatedAlign(
              alignment: _align,
              duration: duration,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if(_align == Alignment.topRight) {
                      _align = Alignment.center;
                    } else {
                      _align = Alignment.topRight;
                    }

                  });
                },
                child: const Text("AnimatedAlign"),
              ),
            ),
          ),
          AnimatedContainer(
              duration: duration,
              height: _height,
              color: _color,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    if(_height == 100) {
                      _height = 150;
                      _color = Colors.blue;
                    } else {
                      _height = 100;
                      _color = Colors.red;
                    }
                  });
                },
                child: const Text(
                  "AnimatedContainer",
                  style: TextStyle(color: Colors.white),
                ),
              )),
          AnimatedDefaultTextStyle(
              child: GestureDetector(
                child: const Text("Hello World"),
                onTap: () {
                  setState(() {
                    if(_style.color == Colors.black) {
                      _style = const TextStyle(
                          color: Colors.blue,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: Colors.blue);
                    } else {
                      _style = const TextStyle(color: Colors.black);
                    }

                  });
                },
              ),
              style: _style,
              duration: duration),
          AnimatedOpacity(
            opacity: _opacity,
            duration: duration,
            child: TextButton(
              onPressed: () {
                setState(() {
                  if(_opacity == 1) {
                    _opacity = 0.2;
                  } else {
                    _opacity = 1;
                  }

                });
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
              child: const Text(
                "AnimatedOpacity",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          AnimatedDecoratedBox1(
            decoration: BoxDecoration(color: _decorationColor),
            duration: Duration(
                milliseconds: _decorationColor == Colors.red ? 400 : 2000),
            child: Builder(
              builder: (BuildContext context) {
                return TextButton(
                  onPressed: () {
                    setState(() {
                      _decorationColor = _decorationColor == Colors.blue
                          ? Colors.red
                          : Colors.blue;
                    });
                  },
                  child: const Text(
                    "AnimatedDecoratedBox toggle",
                    style: TextStyle(color: Colors.white),
                  ),
                );
              },
            ),
          )
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
