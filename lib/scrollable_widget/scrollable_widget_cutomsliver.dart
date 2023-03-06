
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverflexibleheader.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class ScrollableWidgetCustomSliverPager extends StatefulWidget {
  const ScrollableWidgetCustomSliverPager({Key? key}) : super(key: key);
  static const String route = "scrollable_widget_customsliver";

  @override
  State<StatefulWidget> createState() {
    return _ScrollableWidgetCustomSliverState();
  }

}

class _ScrollableWidgetCustomSliverState extends State<ScrollableWidgetCustomSliverPager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomSliver(自定义 Sliver)"),
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
                      child: const Text("Sliver 布局协议", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Sliver 的布局协议如下："),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.Viewport 将当前布局和配置信息通过 SliverConstraints 传递给 Sliver。
2.Sliver 确定自身的位置、绘制等信息，保存在 geometry 中（一个 SliverGeometry 类型的对象）。
3.Viewport 读取 geometry 中的信息来对 Sliver 进行布局和绘制。"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("可以看到，这个过程有两个重要的对象 SliverConstraints 和 SliverGeometry ，我们先看看 SliverConstraints 的定义"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""class SliverConstraints extends Constraints {
    //主轴方向
    AxisDirection? axisDirection;
    //Sliver 沿着主轴从列表的哪个方向插入？枚举类型，正向或反向
    GrowthDirection? growthDirection;
    //用户滑动方向
    ScrollDirection? userScrollDirection;
    //当前Sliver理论上（可能会固定在顶部）已经滑出可视区域的总偏移
    double? scrollOffset;
    //当前Sliver之前的Sliver占据的总高度，因为列表是懒加载，如果不能预估时，该值为double.infinity
    double? precedingScrollExtent;
    //上一个 sliver 覆盖当前 sliver 的大小，通常在 sliver 是 pinned/floating
    //或者处于列表头尾时有效，我们在后面的小节中会有相关的例子。
    double? overlap;
    //当前Sliver在Viewport中的最大可以绘制的区域。
    //绘制如果超过该区域会比较低效（因为不会显示）
    double? remainingPaintExtent;
    //纵轴的长度；如果列表滚动方向是垂直方向，则表示列表宽度。
    double? crossAxisExtent;
    //纵轴方向
    AxisDirection? crossAxisDirection;
    //Viewport在主轴方向的长度；如果列表滚动方向是垂直方向，则表示列表高度。
    double? viewportMainAxisExtent;
    //Viewport 预渲染区域的起点[-Viewport.cacheExtent, 0]
    double? cacheOrigin;
    //Viewport加载区域的长度，范围:
    //[viewportMainAxisExtent,viewportMainAxisExtent + Viewport.cacheExtent*2]
    double? remainingCacheExtent;
}"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("可以看见 SliverConstraints 中包含的信息非常多。当列表滑动时，如果某个 Sliver 已经进入了需要构建的区域，则列表会将 SliverConstraints 信息传递给该 Sliver，Sliver 就可以根据这些信息来确定自身的布局和绘制信息了。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Sliver 需要确定的是 SliverGeometry："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""const SliverGeometry({
  //Sliver在主轴方向预估长度，大多数情况是固定值，用于计算sliverConstraints.scrollOffset
  this.scrollExtent = 0.0, 
  this.paintExtent = 0.0, // 可视区域中的绘制长度
  this.paintOrigin = 0.0, // 绘制的坐标原点，相对于自身布局位置
  //在 Viewport中占用的长度；如果列表滚动方向是垂直方向，则表示列表高度。
  //范围[0,paintExtent]
  double? layoutExtent, 
  this.maxPaintExtent = 0.0,//最大绘制长度
  this.maxScrollObstructionExtent = 0.0,
  double? hitTestExtent, // 点击测试的范围
  bool? visible,// 是否显示
  //是否会溢出Viewport，如果为true，Viewport便会裁剪
  this.hasVisualOverflow = false,
  //scrollExtent的修正值：layoutExtent变化后，为了防止sliver突然跳动（应用新的layoutExtent）
  //可以先进行修正，具体的作用在后面 SliverFlexibleHeader 示例中会介绍。
  this.scrollOffsetCorrection,
  double? cacheExtent, // 在预渲染区域中占据的长度
}) """),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Sliver布局模型和盒布局模型", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("两者布局流程基本相同：父组件告诉子组件约束信息 > 子组件根据父组件的约束确定自身大小 > 父组件获得子组件大小调整其位置。不同是："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""1.父组件传递给子组件的约束信息不同。盒模型传递的是 BoxConstraints，而 Sliver 传递的是 SliverConstraints。
2.描述子组件布局信息的对象不同。盒模型的布局信息通过 Size 和 offset描述 ，而 Sliver的是通过 SliverGeometry 描述。
3.布局的起点不同。Sliver布局的起点一般是Viewport ，而盒模型布局的起点可以是任意的组件。"""),
                    ),
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
                      child: const Text("自定义 Sliver（一）SliverFlexibleHeader", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("SliverFlexibleHeader", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    titleWidget(context, "SliverFlexibleHeader 示例", 0, _onTab)
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
                      child: const Text("自定义 Sliver（二）SliverPersistentHeaderToBox", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们在上一节介绍了 SliverPersistentHeader，在使用时需要遵守两个规则 ："),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们在上一节介绍了 SliverPersistentHeader，在使用时需要遵守两个规则 ："),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("1.必须显式指定高度。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("2.如果我们在使用 SliverPersistentHeader 构建子组件时需要依赖 overlapsContent 参数，则必须保证之前至少还有一个 SliverPersistentHeader 或 SliverAppBar。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("遵守上面这两条规则对于开发者来说心智负担还是较重的，比如对于规则 1，大多数时候我们是不知道 Header 具体的高度的，我们期望直接传一个 widget ，这个 widget 的实际高度 SliverPersistentHeader 能自动算出来。对于规则 2 就更不用说，不知道这个准是要踩坑的。综上，本节我们自定义一个 SliverPersistentHeaderToBox，它可以将任意 RenderBox 适配为可以固定到顶部的 Sliver 而不用显式指定高度，同时避免上面的问题 2。"),
                    ),
                    titleWidget(context, "SliverPersistentHeaderToBox 示例????", 1, _onTab)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onTab(BuildContext context, int index) {
    String? routeKey;
    switch(index) {
      case 0:
        routeKey = SliverFlexibleHeaderSample.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routeKey!);
    };
  }
}
