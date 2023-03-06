
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class BasicStructureOfAnimation extends StatelessWidget {
  const BasicStructureOfAnimation({Key? key}) : super(key: key);

  static const String route = "basicstructureofanimation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("动画基本结构及状态监听"),
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
                      child: const Text("动画基本结构", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("在Flutter中我们可以通过多种方式来实现动画，下面通过一个图片逐渐放大示例的不同实现来演示Flutter中动画的不同实现方式的区别。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("1.基础版本", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(BasicAnimationSample.route);
                      }, child: textcontainer("基础版本示例"),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上面代码中addListener()函数调用了setState()，所以每次动画生成一个新的数字时，当前帧被标记为脏(dirty)，这会导致widget的build()方法再次被调用，而在build()中，改变Image的宽高，因为它的高度和宽度现在使用的是animation.value ，所以就会逐渐放大。值得注意的是动画完成时要释放控制器(调用dispose()方法)以防止内存泄漏。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上面的例子中并没有指定Curve，所以放大的过程是线性的（匀速），下面我们指定一个Curve，来实现一个类似于弹簧效果的动画过程，我们只需要将initState中的代码改为下面这样即可："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(BasicAnimationSample2.route);
                      }, child: textcontainer("弹簧效果示例"),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("细心的读者可能已经发现上面示例中通过addListener()和setState() 来更新UI这一步其实是通用的，如果每个动画中都加这么一句是比较繁琐的。AnimatedWidget类封装了调用setState()的细节，并允许我们将 widget 分离出来，重构后的代码如下："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(BasicAnimationSample3.route);
                      }, child: textcontainer("AnimatedWidget示例"),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("3.用AnimatedBuilder重构", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("用AnimatedWidget 可以从动画中分离出 widget，而动画的渲染过程（即设置宽高）仍然在AnimatedWidget 中，假设如果我们再添加一个 widget 透明度变化的动画，那么我们需要再实现一个AnimatedWidget，这样不是很优雅，如果我们能把渲染过程也抽象出来，那就会好很多，而AnimatedBuilder正是将渲染逻辑分离出来, 上面的 build 方法中的代码可以改为："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(BasicAnimationSample4.route);
                      },child: textcontainer("AnimatedBuilder示例"),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Flutter中正是通过这种方式封装了很多动画，如：FadeTransition、ScaleTransition、SizeTransition等，很多时候都可以复用这些预置的过渡类。"),
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
                      child: const Text("动画状态监听", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上面说过，我们可以通过Animation的addStatusListener()方法来添加动画状态改变监听器。Flutter中，有四种动画状态，在AnimationStatus枚举类中定义，下面我们逐个说明："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset('assets/20230228152425.jpg'),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们将上面图片放大的示例改为先放大再缩小再放大……这样的循环动画。要实现这种效果，我们只需要监听动画状态的改变即可，即：在动画正向执行结束时反转动画，在动画反向执行结束时再正向执行动画。代码如下："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(onPressed: () {
                        Navigator.of(context).pushNamed(BasicAnimationSample5.route);
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

class BasicAnimationSample extends StatefulWidget {
  const BasicAnimationSample({Key? key}) : super(key: key);

  static const String route = 'basicanimationsample';
  @override
  State<StatefulWidget> createState() {
    return _BasicAnimationSampleState();
  }
}

class _BasicAnimationSampleState extends State<BasicAnimationSample> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
    ..addListener(() {
      setState(() {

      });
    }
    );

    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("基础版本示例"),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Image.asset('assets/avatar.jpg',
        width: animation.value,
        height: animation.value,),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class BasicAnimationSample2 extends StatefulWidget {
  const BasicAnimationSample2({Key? key}) : super(key: key);

  static const String route = 'basicanimationsample2';
  @override
  State<StatefulWidget> createState() {
    return _BasicAnimationSampleState2();
  }
}

class _BasicAnimationSampleState2 extends State<BasicAnimationSample2> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {

        });
      }
      );

    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹簧效果示例"),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Image.asset('assets/avatar.jpg',
          width: animation.value,
          height: animation.value,),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class BasicAnimationSample3 extends StatefulWidget {
  const BasicAnimationSample3({Key? key}) : super(key: key);

  static const String route = 'basicanimationsample3';
  @override
  State<StatefulWidget> createState() {
    return _BasicAnimationSampleState3();
  }
}

class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({Key? key, required Listenable listenable}) : super(key: key, listenable: listenable);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Image.asset('assets/avatar.jpg', width: animation.value, height: animation.value,),
    );
  }

}
class _BasicAnimationSampleState3 extends State<BasicAnimationSample3> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() {
        setState(() {

        });
      }
      );

    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("弹簧效果示例"),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: AnimatedImage(listenable: animation,)),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({Key? key, required this.animation, this.child}) : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: Image.asset('assets/avatar.jpg'),
        builder: (BuildContext context, Widget? child) {
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
      ),
    );
  }

}

class BasicAnimationSample4 extends StatefulWidget {
  const BasicAnimationSample4({Key? key}) : super(key: key);

  static const String route = 'basicanimationsample4';
  @override
  State<StatefulWidget> createState() {
    return _BasicAnimationSampleState4();
  }
}
class _BasicAnimationSampleState4 extends State<BasicAnimationSample4> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);

    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedBuilder示例"),
      ),
      body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: GrowTransition(animation: animation /*,child: Image.asset('assets/avatar.jpg'),*/)),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class BasicAnimationSample5 extends StatefulWidget {
  const BasicAnimationSample5({Key? key}) : super(key: key);

  static const String route = 'basicanimationsample5';
  @override
  State<StatefulWidget> createState() {
    return _BasicAnimationSampleState5();
  }
}
class _BasicAnimationSampleState5 extends State<BasicAnimationSample5> with SingleTickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));

    //使用弹性曲线
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(animation);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if(status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedBuilder示例"),
      ),
      body: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: GrowTransition(animation: animation /*,child: Image.asset('assets/avatar.jpg'),*/)),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
