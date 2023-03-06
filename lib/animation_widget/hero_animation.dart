import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

import '../custom_element/after_layout.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  static const String route = "heroanimation";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hero动画"),
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
                        child: const Text(
                          "自实现Hero动画",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(CustomHeroAnimation.route);
                          },
                          child: textcontainer("自定义实现Hero动画"),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("可以看到，整个飞行动画的实现还是比较复杂的，但由于这种飞行动画在交互上会经常被用到，因此 Flutter 在框架层抽象了上述实现飞行动画的逻辑，提供了一种通用且简单的实现 Hero 动画的方式。"),
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
                        child: const Text("Flutter Hero动画", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("Hero 指的是可以在路由(页面)之间“飞行”的 widget，简单来说 Hero 动画就是在路由切换时，有一个共享的widget 可以在新旧路由间切换。由于共享的 widget 在新旧路由页面上的位置、外观可能有所差异，所以在路由切换时会从旧路逐渐过渡到新路由中的指定位置，这样就会产生一个 Hero 动画"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("你可能多次看到过 hero 动画。例如，一个路由中显示待售商品的缩略图列表，选择一个条目会将其跳转到一个新路由，新路由中包含该商品的详细信息和“购买”按钮。 在Flutter中将图片从一个路由“飞”到另一个路由称为hero动画，尽管相同的动作有时也称为 共享元素转换。下面我们通过一个示例来体验一下 hero 动画。"),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("示例", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""假设有两个路由A和B，他们的内容交互如下：

A：包含一个用户头像，圆形，点击后跳到B路由，可以查看大图。

B：显示用户头像原图，矩形。

在AB两个路由之间跳转的时候，用户头像会逐渐过渡到目标路由页的头像上，接下来我们先看看代码，然后再解析。"""),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 10),
                        child: TextButton(onPressed: () {
                          Navigator.of(context).pushNamed(HeroAnimationRouteA.route);
                        }, child: textcontainer("Hero 示例"),),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("我们可以看到，实现 Hero 动画只需要用Hero组件将要共享的 widget 包装起来，并提供一个相同的 tag 即可，中间的过渡帧都是 Flutter 框架自动完成的。必须要注意， 前后路由页的共享Hero的 tag 必须是相同的，Flutter 框架内部正是通过 tag 来确定新旧路由页widget的对应关系的。"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("Hero 动画的原理比较简单，Flutter 框架知道新旧路由页中共享元素的位置和大小，所以根据这两个端点，在动画执行过程中求出过渡时的插值（中间态）即可，而感到幸运的是，这些事情不需要我们自己动手，Flutter 已经帮我们做了，实际上，Flutter Hero 动画的实现原理和我们在本章开始自实现的原理是差不多的，读者有兴趣可以去看 Hero 动画相关的源码。"),
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

class CustomHeroAnimation extends StatefulWidget {
  const CustomHeroAnimation({Key? key}) : super(key: key);

  static const String route = "customheroanimation";

  @override
  State<StatefulWidget> createState() {
    return _CustomHeroAnimationState();
  }
}

class _CustomHeroAnimationState extends State<CustomHeroAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _animating = false;
  AnimationStatus? _lastAnimationStatus;
  late Animation _animation;

  Rect? child1Rect;
  Rect? child2Rect;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.addListener(() {
      if (_controller.isCompleted || _controller.isDismissed) {
        if (_animating) {
          setState(() {
            _animating = false;
          });
        }
      } else {
        _lastAnimationStatus = _controller.status;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //小头像
    final Widget child1 = wChild1();
    //大头像
    final Widget child2 = wChild2();
    //是否展示小头像；只有在动画执行时、初始状态或者刚从大图变为小图时才应该显示小头像
    bool showChild1 =
        !_animating && _lastAnimationStatus != AnimationStatus.forward;

    Widget target;
    if (showChild1 || _controller.status == AnimationStatus.reverse) {
      target = child1;
    } else {
      target = child2;
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.white,
          child: SizedBox(
            //我们让Stack 填满屏幕剩余空间
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                if (showChild1)
                  AfterLayout(
                    //获取小图在Stack中占用的Rect信息
                    callback: (RenderAfterLayout value) {
                      child1Rect = _getRect(value);
                    },
                    child: child1,
                  ),
                if (!showChild1)
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget? child) {
                      //求出 rect 插值
                      final rect =
                          Rect.lerp(child1Rect, child2Rect, _animation.value);
                      // 通过 Positioned 设置组件大小和位置
                      return Positioned.fromRect(rect: rect!, child: child!);
                    },
                    child: target,
                  ),
                // 用于测量 child2 的大小，设置为全透明并且不能响应事件
                IgnorePointer(
                  child: Center(
                    child: Opacity(
                      opacity: 0,
                      child: AfterLayout(
                        //获取大图在Stack中占用的Rect信息
                        callback: (RenderAfterLayout ral) {
                          child2Rect = _getRect(ral);
                        },
                        child: child2,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget wChild1() {
    //点击后执行正向动画
    return GestureDetector(
      onTap: () {
        setState(() {
          _animating = true;
          _controller.forward();
        });
      },
      child: SizedBox(
        width: 50,
        child: ClipOval(
          child: Image.asset('assets/avatar.jpg'),
        ),
      ),
    );
  }

  Widget wChild2() {
    // 点击后执行反向动画
    return GestureDetector(
      onTap: () {
        setState(() {
          _animating = true;
          _controller.reverse();
        });
      },
      child: SizedBox(
        width: 400,
        child: ClipOval(
          child: Image.asset('assets/avatar.jpg'),
        ),
      ),
    );
  }

  Rect? _getRect(RenderAfterLayout renderAfterLayout) {
    //我们需要获取的是AfterLayout子组件相对于Stack的Rect
    return renderAfterLayout.localToGlobal(
          Offset.zero,
          //找到Stack对应的 RenderObject 对象
          ancestor: context.findRenderObject(),
        ) &
        renderAfterLayout.size;
  }
}

class HeroAnimationRouteA extends StatelessWidget {
  const HeroAnimationRouteA({Key? key}) : super(key: key);

  static const String route = "heroanimationroutea";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        children: [
          Material(
            child: Padding(
             padding: const EdgeInsets.only(top: 30),
              child: InkWell(
                child: Hero(
                  tag: "avatar",
                  child: ClipOval(
                    child: Image.asset('assets/avatar.jpg', width: 50.0,),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return FadeTransition(opacity: animation, child: Scaffold(
                              // appBar: AppBar(
                              //   title: const Text("原图"),
                              // ),
                              body: const HeroAnimationRouteB(),
                            ),);
                          }));
                },
              ),
            ),

          ),

          const Padding(padding: EdgeInsets.only(top: 10),
          child: Text("点击头像"),)
        ],
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key? key}) : super(key: key);
  static const String route = "heroanimationrouteb";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("原图"),
      ),
      body: Center(
        child: Hero(
          tag: 'avatar',
          child: Image.asset('assets/avatar.jpg'),
        ),
      ),
    );
  }

}
