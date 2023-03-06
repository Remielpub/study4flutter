
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_customsrollview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverheaderdelegate.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_slivers.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_slivertoboxadapter.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class ScrollableWidgetCustomScrollViewPager extends StatefulWidget {
  const ScrollableWidgetCustomScrollViewPager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_customscrollview";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetCustomScrollViewState();
  }

}

class _ScrollableWidgetCustomScrollViewState extends State<ScrollableWidgetCustomScrollViewPager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomScrollView 和 Slivers"),
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
                      child: const Text("CustomScrollView", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("创建两个ListView，滑动时，两个Widget独立响应事件并进行滑动，无法实现平铺试图效果。之所以会这样的原因是两个 ListView 都有自己独立的 Scrollable 、 Viewport 和 Sliver，既然如此，我们自己创建一个共用的 Scrollable 和 Viewport 对象，然后再将两个 ListView 对应的 Sliver 添加到这个共用的 Viewport 对象中就可以实现我们想要的效果了。CustomScrollView 组件来帮助我们创建一个公共的 Scrollable 和 Viewport ，然后它的 slivers 参数接受一个 Sliver 数组，这样我们就可以使用CustomScrollView 方面的实现我们期望的功能了"),
                    ),
                    titleWidget(context, "示例", 0, _onClick),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("综上，CustomScrollView 的主要功能是提供一个公共的的 Scrollable 和 Viewport，来组合多个 Sliver"),
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
                      child: const Text("Flutter 中常用的 Sliver"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text("之前小节介绍过的可滚动组件都有对应的 Sliver："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset("assets/20230208141525.jpg"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("除了和列表对应的 Sliver 之外还有一些用于对 Sliver 进行布局、装饰的组件，它们的子组件必须是 Sliver，我们列举几个常用的："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset("assets/20230208142030.jpg"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("还有一些其他常用的 Sliver："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset("assets/20230208142133.jpg"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: const Text("Sliver系列 Widget 比较多，我们不会一一介绍，读者只需记住它的特点，需要时再去查看文档即可。上面之所以说“大多数”Sliver都和可滚动组件对应，是由于还有一些如SliverPadding、SliverAppBar 等是和可滚动组件无关的，它们主要是为了结合CustomScrollView一起使用，这是因为CustomScrollView的子组件必须都是Sliver。"),
                    ),
                    titleWidget(context, "示例", 1, _onClick),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("代码分为三部分："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: const Text("""头部SliverAppBar：SliverAppBar对应AppBar，两者不同之处在于SliverAppBar可以集成到CustomScrollView。SliverAppBar可以结合FlexibleSpaceBar实现Material Design中头部伸缩的模型，具体效果，读者可以运行该示例查看。
中间的SliverGrid：它用SliverPadding包裹以给SliverGrid添加补白。SliverGrid是一个两列，宽高比为4的网格，它有20个子组件。
底部SliverFixedExtentList：它是一个所有子元素高度都为50像素的列表。"""),
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
                      child: const Text("SliverToBoxAdapter", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("在实际布局中，我们通常需要往 CustomScrollView 中添加一些自定义的组件，而这些组件并非都有 Sliver 版本，为此 Flutter 提供了一个 SliverToBoxAdapter 组件，它是一个适配器：可以将 RenderBox 适配为 Sliver。比如我们想在列表顶部添加一个可以横向滑动的 PageView，可以使用 SliverToBoxAdapter 来配置"),
                    ),
                    titleWidget(context, "示例", 2, _onClick),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("注意，上面的代码是可以正常运行的，但是如果将 PageView 换成一个滑动方向和 CustomScrollView 一致的 ListView 则不会正常工作！原因是：CustomScrollView 组合 Sliver 的原理是为所有子 Sliver 提供一个共享的 Scrollable，然后统一处理指定滑动方向的滑动事件，如果 Sliver 中引入了其他的 Scrollable，则滑动事件便会冲突。上例中 PageView 之所以能正常工作，是因为 PageView 的 Scrollable 只处理水平方向的滑动，而 CustomScrollView 是处理垂直方向的，两者并未冲突，所以不会有问题，但是换一个也是垂直方向的 ListView 时则不能正常工作，最终的效果是，在ListView内滑动时只会对ListView 起作用，原因是滑动事件被 ListView 的 Scrollable 优先消费，CustomScrollView 的 Scrollable 便接收不到滑动事件了"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      child: const Text("Flutter 中手势的冲突时，默认的策略是子元素生效，这个我们将在后面事件处理相关章节介绍。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("所以我们可以得出一个结论：如果 CustomScrollView 有孩子也是一个完整的可滚动组件且它们的滑动方向一致，则 CustomScrollView 不能正常工作。要解决这个问题，可以使用 NestedScrollView"),
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
                      child: const Text("SliverPersistentHeader", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const SliverPersistentHeader({
  Key? key,
  // 构造 header 组件的委托
  required SliverPersistentHeaderDelegate delegate,
  this.pinned = false, // header 滑动到可视区域顶部时是否固定在顶部
  this.floating = false, // 正文部分介绍
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("floating 的做用是：pinned 为 false 时 ，则 header 可以滑出可视区域（CustomScrollView 的 Viewport）（不会固定到顶部），当用户再次向下滑动时，此时不管 header 已经被滑出了多远，它都会立即出现在可视区域顶部并固定住，直到继续下滑到 header 在列表中原来的位置时，header 才会重新回到原来的位置（不再固定在顶部）"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("delegate 是用于生成 header 的委托，类型为 SliverPersistentHeaderDelegate，它是一个抽象类，需要我们自己实现，定义如下"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""abstract class SliverPersistentHeaderDelegate {

  // header 最大高度；pined为 true 时，当 header 刚刚固定到顶部时高度为最大高度。
  double get maxExtent;
  
  // header 的最小高度；pined为true时，当header固定到顶部，用户继续往上滑动时，header
  // 的高度会随着用户继续上滑从 maxExtent 逐渐减小到 minExtent
  double get minExtent;

  // 构建 header。
  // shrinkOffset取值范围[0,maxExtent],当header刚刚到达顶部时，shrinkOffset 值为0，
  // 如果用户继续向上滑动列表，shrinkOffset的值会随着用户滑动的偏移减小，直到减到0时。
  //
  // overlapsContent：一般不建议使用，在使用时一定要小心，后面会解释。
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent);
  
  // header 是否需要重新构建；通常当父级的 StatefulWidget 更新状态时会触发。
  // 一般来说只有当 Delegate 的配置发生变化时，应该返回false，比如新旧的 minExtent、maxExtent
  // 等其他配置不同时需要返回 true，其余情况返回 false 即可。
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate);

  // 下面这几个属性是SliverPersistentHeader在SliverAppBar中时实现floating、snap 
  // 效果时会用到，平时开发过程很少使用到，读者可以先不用理会。
  TickerProvider? get vsync => null;
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

}"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("可以看到，我们最需要关注的就是maxExtent 和 minExtent；pined为true 时，当 header 刚刚固定到顶部，此时会对它应用 maxExtent （最大高度）；当用户继续往上滑动时，header 的高度会随着用户继续上滑从 maxExtent 逐渐减小到 minExtent。如果我们想让 header 高度固定，则将 maxExtent 和 minExtent 指定为同样的值即可。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("为了构建 header 我们必须要定义一个类，让它继承自 SliverPersistentHeaderDelegate，这无疑会增加使用成本！为此，我们封装一个通用的委托构造器 SliverHeaderDelegate，通过它可以快速构建 SliverPersistentHeaderDelegate."),
                    ),
                    titleWidget(context, "示例", 3, _onClick),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("一些注意点", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们说过 SliverPersistentHeader 的 builder 参数 overlapsContent 一般不建议使用，使用时要当心。因为按照 overlapsContent 变量名的字面意思，只要有内容和 Sliver 重叠时就应该为 true，但是如果我们在上面示例的 builder 中打印一下 overlapsContent 的值就会发现第一个 PersistentHeader 1 的 overlapsContent 值一直都是 false，而 PersistentHeader 2 则是正常的，如果我们再添加几个 SliverPersistentHeader ，发现新添加的也都正常。总结一下：当有多个 SliverPersistentHeader时，需要注意第一个 SliverPersistentHeader 的 overlapsContent 值会一直为 false。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们可以定一条约定：如果我们在使用 SliverPersistentHeader 构建子组件时需要依赖 overlapsContent 参数，则必须保证之前至少还有一个 SliverPersistentHeader 或 SliverAppBar（SliverAppBar 在当前 Flutter 版本的实现中内部包含了SliverPersistentHeader）。"),
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
                      child: const Text("总结", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""CustomScrollView 组合 Sliver 的原理是为所有子 Sliver 提供一个共享的 Scrollable，然后统一处理指定滑动方向的滑动事件。
CustomScrollView 和 ListView、GridView、PageView 一样，都是完整的可滚动组件（同时拥有 Scrollable、Viewport、Sliver）。
CustomScrollView 只能组合 Sliver，如果有孩子也是一个完整的可滚动组件（通过 SliverToBoxAdapter 嵌入）且它们的滑动方向一致时便不能正常工作。"""),
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

  _onClick(BuildContext context, int i) {
    String? routeKey;
    switch(i) {
      case 0:
        routeKey = CustomScrollViewSample.route;
        break;
      case 1:
        routeKey = CustomSliversSample.route;
        break;
      case 2:
        routeKey = SliverToBoxAdaptersSample.route;
        break;
      case 3:
        routeKey = SliverHeaderDelegateSample.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routeKey!);
    };
  }
}
