import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class EventGesture extends StatefulWidget {
  const EventGesture({Key? key}) : super(key: key);

  static const String route = "eventgesture";

  @override
  State<StatefulWidget> createState() => _EventGestureState();
}

class _EventGestureState extends State<EventGesture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("手势识别"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "GestureDetector",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                      "GestureDetector是一个用于手势识别的功能性组件，我们通过它可以来识别各种手势。GestureDetector 内部封装了 Listener，用以识别语义化的手势，接下来我们详细介绍一下各种手势的识别"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "1. 点击、双击、长按",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(GestureDetectorSample1.route);
                    },
                    child: textcontainer("示例"),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "2. 拖动，滑动",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(GestureDetectorSample2.route);
                    },
                    child: textcontainer("示例"),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("代码解释："),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("""DragDownDetails.globalPosition：当用户按下时，此属性为用户按下的位置相对于屏幕（而非父组件）原点(左上角)的偏移。
DragUpdateDetails.delta：当用户在屏幕上滑动时，会触发多次Update事件，delta指一次Update事件的滑动的偏移量。
DragEndDetails.velocity：该属性代表用户抬起手指时的滑动速度(包含x、y两个轴的），示例中并没有处理手指抬起时的速度，常见的效果是根据用户抬起手指时的速度做一个减速动画。"""),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "3. 缩放",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextButton(onPressed: () {
                    Navigator.of(context).pushNamed(GestureDetectorSample3.route);
                  },
                  child: textcontainer("缩放示例"),),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "GestureRecognizer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("假设我们要给一段富文本（RichText）的不同部分分别添加点击事件处理器，但是TextSpan并不是一个widget，这时我们不能用GestureDetector，但TextSpan有一个recognizer属性，它可以接收一个GestureRecognizer。"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TextButton(onPressed: () {
                    Navigator.of(context).pushNamed(GestureDetectorSample4.route);
                  },
                    child: textcontainer("GestureRecognizer示例"),),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("注意：使用GestureRecognizer后一定要调用其dispose()方法来释放资源（主要是取消内部的计时器）。"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GestureDetectorSample1 extends StatefulWidget {
  static const String route = "GestureDetectorSample1";

  GestureDetectorSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GestureDetectorSampleState();
}

class _GestureDetectorSampleState extends State<GestureDetectorSample1> {
  String _operation = "No Gesture detected!";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue,
          width: 200,
          height: 200,
          child: Text(
            _operation,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
        onTap: () => updateText("Tap"),
        onDoubleTap: () => updateText("Double Tap"),
        onLongPress: () => updateText("Long Press"),
      ),
    );
  }

  updateText(String s) {
    setState(() {
      _operation = s;
    });
  }
}

class GestureDetectorSample2 extends StatefulWidget {
  static const String route = "GestureDetectorSample2";

  GestureDetectorSample2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GestureDetectorSampleState2();
}

class _GestureDetectorSampleState2 extends State<GestureDetectorSample2> {
  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: const CircleAvatar(
                child: Text("A"),
              ),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails e) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                //打印滑动结束时在x、y轴上的速度
                print(e.velocity);
              },
            ))
      ],
    );
  }
}

class GestureDetectorSample3 extends StatefulWidget {
  static const String route = "GestureDetectorSample3";

  GestureDetectorSample3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GestureDetectorSampleState3();
}

class _GestureDetectorSampleState3 extends State<GestureDetectorSample3> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: GestureDetector(
              child: Image.asset(
            "assets/avatar.jpg",
            width: _width,
          ),
            onScaleUpdate: (ScaleUpdateDetails details) {
                setState(() {
                  _width = 200 * details.scale.clamp(.5, 100);
                });
            },
          ),
        )
      ],
    );
  }
}

class GestureDetectorSample4 extends StatefulWidget {
  static const String route = "GestureDetectorSample4";

  GestureDetectorSample4({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GestureDetectorSampleState4();
}

class _GestureDetectorSampleState4 extends State<GestureDetectorSample4> {
  TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Text.rich(TextSpan(
        children: [
          TextSpan(text: "Hello World!"),
        TextSpan(
            text: "点击变色",
            style: TextStyle(
              fontSize: 30.0,
              color: _toggle ? Colors.red : Colors.black54,
            ),
            recognizer: _tapGestureRecognizer..onTap = () {
              setState(() {
                _toggle = !_toggle;
              });
            }),

        ]
      )),
    );
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }
}
