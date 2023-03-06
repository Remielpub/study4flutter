import 'package:flutter/material.dart';
import 'package:flutter_demo/animation_widget/animation_widget.dart';
import 'package:flutter_demo/basewidget/base_widget_circularprogressindicator_pager.dart';
import 'package:flutter_demo/basewidget/base_widget_switch.dart';
import 'package:flutter_demo/basewidget/button_style_pager.dart';
import 'package:flutter_demo/basewidget/widget_customprogressindicator_pager.dart';
import 'package:flutter_demo/basewidget/widget_textfield_route.dart';
import 'package:flutter_demo/containerwidget/container_floatingactionbutton_pager.dart';
import 'package:flutter_demo/containerwidget/container_padding_pager.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_animatedlist.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_customscrollview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_cutomsliver.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_gridview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_introduce.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_listener_and_control.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_listview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_nestedScrollView.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_nestedscrollview_sample.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_pagerview_and_cache.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_route_pager.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverflexibleheader.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_sliverheaderdelegate.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_slivers.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sample_slivertoboxadapter.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_scrollable.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_singlechildscrollview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_sliveroverlapabsorber_sample.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_snapappbar_sample.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_tabbarview.dart';
import 'package:flutter_demo/scrollable_widget/scrollable_widget_withtabbarview_sample.dart';
import 'animation_widget/Interleave_animation.dart';
import 'animation_widget/animated_switcher.dart';
import 'animation_widget/animation_transition_components.dart';
import 'animation_widget/animation_widget_introduce.dart';
import 'animation_widget/basic_structure_of_animation.dart';
import 'animation_widget/custom_route_switch_animation.dart';
import 'animation_widget/hero_animation.dart';
import 'basewidget/base_widget_checkbox.dart';
import 'basewidget/base_widget_default_text_style_route.dart';
import 'basewidget/base_widget_elevate_button_pager.dart';
import 'basewidget/base_widget_icon_button.dart';
import 'basewidget/base_widget_icon_pager.dart';
import 'basewidget/base_widget_outline_button.dart';
import 'basewidget/base_widget_route.dart';
import 'basewidget/base_widget_text_button.dart';
import 'basewidget/base_widget_text_span_route.dart';
import 'basewidget/base_widget_text_style.dart';
import 'basewidget/widget_form_pager.dart';
import 'basewidget/widget_image.dart';
import 'basewidget/widget_linearprogressindicator_pager.dart';
import 'const_value.dart';
import 'containerwidget/container_appbar_pager.dart';
import 'containerwidget/container_button_tag_pager.dart';
import 'containerwidget/container_clip_pager.dart';
import 'containerwidget/container_container_pager.dart';
import 'containerwidget/container_decoratedbox_pager.dart';
import 'containerwidget/container_drawer_pager.dart';
import 'containerwidget/container_fittedbox_pager.dart';
import 'containerwidget/container_route_pager.dart';
import 'containerwidget/container_scaffold_pager.dart';
import 'containerwidget/container_transform_pager.dart';
import 'custom_components/custom_components_checkbox.dart';
import 'custom_components/custom_components_circle_gradient_progress.dart';
import 'custom_components/custom_components_custompaint_and_canvas.dart';
import 'custom_components/custom_components_done_widget.dart';
import 'custom_components/custom_components_route.dart';
import 'custom_components/custom_components_combination.dart';
import 'custom_components/custom_components_introduce.dart';
import 'custom_components/custom_components_sample_turnbox.dart';
import 'custom_element/event_bus.dart';
import 'custom_element/principles_of_gesture_recognition.dart';
import 'eventandnotification/event_and_notification_route_pager.dart';
import 'eventandnotification/event_bus_sample.dart';
import 'eventandnotification/event_gesture.dart';
import 'eventandnotification/flutter_event_mechanism.dart';
import 'eventandnotification/original_point_event.dart';
import 'file_operation_and_network/FileOperationAndNetwork.dart';
import 'file_operation_and_network/file_operation.dart';
import 'functionalwidget/functinal_widget_inheritedwidget.dart';
import 'functionalwidget/functinal_widget_inheritedwidget_sample.dart';
import 'functionalwidget/functinal_widget_inheritedwidget_shopping_sample.dart';
import 'functionalwidget/functinal_widget_willpopscope.dart';
import 'functionalwidget/functional_route_pager.dart';
import 'functionalwidget/functional_widget_color_and_theme.dart';
import 'functionalwidget/functional_widget_cross_component_state_sharing.dart';
import 'functionalwidget/functional_widget_dialog.dart';
import 'functionalwidget/functional_widget_futurebuilder_and_streambuilder.dart';
import 'functionalwidget/functional_widget_notification.dart';
import 'functionalwidget/functional_widget_valuelistenablebuilder.dart';
import 'layout_widget/layout_widget_align_pager.dart';
import 'layout_widget/layout_widget_constraints_pager.dart';
import 'layout_widget/layout_widget_custom_layout_pager.dart';
import 'layout_widget/layout_widget_flex_pager.dart';
import 'layout_widget/layout_widget_framelayout_pager.dart';
import 'layout_widget/layout_widget_introduce_pager.dart';
import 'layout_widget/layout_widget_linearlayout_pager.dart';
import 'layout_widget/layout_widget_route.dart';
import 'layout_widget/layout_widget_wrap_flow_pager.dart';
import 'scrollable_widget/scrollable_widget_sample_customsrollview.dart';
import 'utils/widget_util.dart';
import 'basewidget/base_widget_text_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: "/",
      routes: {
        route_key_home: (context) => const MyHomePage(),
        //基础组件路由
        route_key_base_widget: (context) => const BaseWidgetRoute(),
        route_key_text_content: (context) => const BaseWidgetTextRoute(),
        route_key_text_style: (context) => const BaseWidgetTextStyleRoute(),
        route_key_text_span: (context) => const BaseWidgetTextSpanRoute(),
        route_key_default_text_style: (context) =>
            const BaseWidgetDefaultTextStyleRoute(),
        route_key_elevated_button: (context) =>
            const BaseWidgetElevatedButtonPager(),
        BaseWidgetTextButtonPager.route: (context) =>
            const BaseWidgetTextButtonPager(),
        BaseWidgetOutlineButtonPager.route: (context) =>
            const BaseWidgetOutlineButtonPager(),
        IconButtonPager.route: (context) => const IconButtonPager(),
        ButtonStylePager.route: (context) => const ButtonStylePager(),
        WidgetImagePager.route: (context) => const WidgetImagePager(),
        WidgetIconPager.route: (context) => const WidgetIconPager(),
        WidgetSwitchPager.route: (context) => const WidgetSwitchPager(),
        WidgetCheckBoxPager.route: (context) => const WidgetCheckBoxPager(),
        WidgetTextFieldPager.route: (context) => const WidgetTextFieldPager(),
        WidgetFormPager.route: (context) => const WidgetFormPager(),
        WidgetLinearProgressIndicatorPager.route: (context) =>
            const WidgetLinearProgressIndicatorPager(),
        WidgetCircularProgressIndicatorPager.route: (context) =>
            const WidgetCircularProgressIndicatorPager(),
        WidgetCustomProgressIndicatorPager.route: (context) =>
            const WidgetCustomProgressIndicatorPager(),
        //容器组件路由
        ContainerRoutePager.route: (context) => const ContainerRoutePager(),
        ContainerPaddingPager.route: (context) => const ContainerPaddingPager(),
        ContainerDecoratedBoxPager.route: (context) =>
            const ContainerDecoratedBoxPager(),
        ContainerTransformPager.route: (context) =>
            const ContainerTransformPager(),
        ContainerContainerPager.route: (context) =>
            const ContainerContainerPager(),
        ContainerClipPager.route: (context) => const ContainerClipPager(),
        ContainerFittedBoxPager.route: (context) =>
            const ContainerFittedBoxPager(),
        ContainerScaffoldPager.route: (context) =>
            const ContainerScaffoldPager(),
        ContainerAppBarPager.route: (context) => const ContainerAppBarPager(),
        ContainerDrawerPager.route: (context) => const ContainerDrawerPager(),
        ContainerFloatingActionButtonPager.route: (context) =>
            const ContainerFloatingActionButtonPager(),
        ContainerBottomTagPager.route: (context) =>
            const ContainerBottomTagPager(),
        //布局组件路由
        LayoutRoutePager.route: (context) => const LayoutRoutePager(),
        LayoutWidgetIntroducePager.route: (context) =>
            const LayoutWidgetIntroducePager(),
        LayoutWidgetConstraintsPager.route: (context) =>
            const LayoutWidgetConstraintsPager(),
        LayoutWidgetLinearLayoutPager.route: (context) =>
            const LayoutWidgetLinearLayoutPager(),
        LayoutWidgetFLexPager.route: (context) => const LayoutWidgetFLexPager(),
        LayoutWidgetWrapFlowPager.route: (context) =>
            const LayoutWidgetWrapFlowPager(),
        LayoutWidgetFrameLayoutPager.route: (context) =>
            const LayoutWidgetFrameLayoutPager(),
        LayoutWidgetAlignPager.route: (context) =>
            const LayoutWidgetAlignPager(),
        LayoutWidgetCustomLayoutPager.route: (context) =>
            const LayoutWidgetCustomLayoutPager(),
        //可滚动组件路由
        ScrollableWidgetRoutePager.route: (context) =>
            const ScrollableWidgetRoutePager(),
        ScrollableWidgetIntroducePager.route: (context) =>
            const ScrollableWidgetIntroducePager(),
        ScrollableWidgetSingleChildScrollViewPager.route: (context) =>
            const ScrollableWidgetSingleChildScrollViewPager(),
        ScrollableWidgetListViewPager.route: (context) =>
            const ScrollableWidgetListViewPager(),
        ScrollableWidgetListenerAndControlPager.route: (context) =>
            const ScrollableWidgetListenerAndControlPager(),
        ScrollableWidgetAnimatedListPager.route: (context) =>
            const ScrollableWidgetAnimatedListPager(),
        ScrollableWidgetGridViewPager.route: (context) =>
            const ScrollableWidgetGridViewPager(),
        ScrollableWidgetPagerViewAndCachePager.route: (context) =>
            const ScrollableWidgetPagerViewAndCachePager(),
        ScrollableWidgetScrollableCachePager.route: (context) =>
            const ScrollableWidgetScrollableCachePager(),
        ScrollableWidgetTabBarViewPager.route: (context) =>
            const ScrollableWidgetTabBarViewPager(),
        ScrollableWidgetCustomScrollViewPager.route: (context) =>
            const ScrollableWidgetCustomScrollViewPager(),
        ScrollableWidgetCustomSliverPager.route: (context) =>
            const ScrollableWidgetCustomSliverPager(),
        ScrollableWidgetNestedScrollViewPager.route: (context) =>
            const ScrollableWidgetNestedScrollViewPager(),
        CustomScrollViewSample.route: (context) =>
        const CustomScrollViewSample(),
        CustomSliversSample.route: (context) =>
        const CustomSliversSample(),
        SliverToBoxAdaptersSample.route: (context) =>
        const SliverToBoxAdaptersSample(),
        SliverHeaderDelegateSample.route: (context) =>
        const SliverHeaderDelegateSample(),
        SliverFlexibleHeaderSample.route:(context) =>
        const SliverFlexibleHeaderSample(),
        NestedScrollViewSample.route:(context) =>
        const NestedScrollViewSample(),
        SnapAppBarSample.route:(context) =>
        const SnapAppBarSample(),
        SnapAppBarSample2.route:(context) =>
        const SnapAppBarSample2(),
        WithTabbarViewSample.route:(context) =>
        const WithTabbarViewSample(),
        //功能组件路由
        FunctionalRoutePager.route:(context) =>
        const FunctionalRoutePager(),
        WillPopScopeSample.route:(context) =>
        const WillPopScopeSample(),
        FunctionalWidgetInheritedWidget.route:(context) =>
        const FunctionalWidgetInheritedWidget(),
        FunctionalWidgetInheritedSampleWidget.route:(context) =>
        const FunctionalWidgetInheritedSampleWidget(),
        FunctionalWidgetCrollComponentStateSharing.route:(context) =>
        const FunctionalWidgetCrollComponentStateSharing(),
        ShoppingSample.route:(context) =>
        const ShoppingSample(),
        ShoppingSample2.route:(context) =>
        const ShoppingSample2(),
        FunctionalWidgetColorAndTheme.route:(context) =>
        const FunctionalWidgetColorAndTheme(),
        ColorSample.route:(context) =>
        const ColorSample(),
        ThemeSample.route:(context) =>
        const ThemeSample(),
        FunctionalWidgetValueListenableBuilder.route:(context) =>
        const FunctionalWidgetValueListenableBuilder(),
        ValueListenableBuilderSample.route:(context) =>
        const ValueListenableBuilderSample(),
        FunctionalWidgetFutureBuilderAndStreamBuilder.route:(context) =>
        const FunctionalWidgetFutureBuilderAndStreamBuilder(),
        FutureBuilderSample.route:(context) =>
        const FutureBuilderSample(),
        StreamBuilderSample.route:(context) =>
        const StreamBuilderSample(),
        FunctionalWidgetDialog.route:(context) =>
        const FunctionalWidgetDialog(),
        //事件处理与通知
        EventAndNotificationRoutePager.route:(context) =>
        const EventAndNotificationRoutePager(),
        OriginalPointEventHandle.route:(context) =>
        const OriginalPointEventHandle(),
        PointerMoveIndicator.route:(context) =>
        const PointerMoveIndicator(),
        EventGesture.route:(context) =>
        const EventGesture(),
        GestureDetectorSample1.route:(context) =>
        GestureDetectorSample1(),
        GestureDetectorSample2.route:(context) =>
            GestureDetectorSample2(),
        GestureDetectorSample3.route:(context) =>
            GestureDetectorSample3(),
        GestureDetectorSample4.route:(context) =>
            GestureDetectorSample4(),
        FlutterEventMechanism.route:(context) =>
            const FlutterEventMechanism(),
        WaterMaskTest.route:(context) =>
        const WaterMaskTest(),
        HitTestBlockerSample.route:(context) =>
        const HitTestBlockerSample(),
        GestureHitTestSample.route:(context) =>
        const GestureHitTestSample(),
        PrinciplesOfGestureRecognition.route:(context) =>
        const PrinciplesOfGestureRecognition(),
        EventBusSmaple.route:(context) =>
        const EventBusSmaple(),
        FunctionalWidgetNotification.route:(context) =>
        const FunctionalWidgetNotification(),
        NotificationSample.route:(context) =>
        const NotificationSample(),
        MyNotificationSample.route:(context) =>
        const MyNotificationSample(),
        NotificationInterceptSample.route:(context) =>
        const NotificationInterceptSample(),

        //动画
        AnimationWidget.route:(context) =>
            const AnimationWidget(),
        AnimationWidgetIntroduce.route:(context) =>
        const AnimationWidgetIntroduce(),
        BasicStructureOfAnimation.route:(context) =>
        const BasicStructureOfAnimation(),
        BasicAnimationSample.route:(context) =>
        const BasicAnimationSample(),
        BasicAnimationSample2.route:(context) =>
        const BasicAnimationSample2(),
        BasicAnimationSample3.route:(context) =>
        const BasicAnimationSample3(),
        BasicAnimationSample4.route:(context) =>
        const BasicAnimationSample4(),
        BasicAnimationSample5.route:(context) =>
        const BasicAnimationSample5(),
        CustomRouteSwitchAnimation.route:(context) =>
        const CustomRouteSwitchAnimation(),
        RouteAnimatedSample1.route:(context) =>
        const RouteAnimatedSample1(),
        HeroAnimation.route:(context) =>
        const HeroAnimation(),
        CustomHeroAnimation.route:(context) =>
        const CustomHeroAnimation(),
        HeroAnimationRouteA.route:(context) =>
        const HeroAnimationRouteA(),
        HeroAnimationRouteB.route:(context) =>
        const HeroAnimationRouteB(),
        InterleaveAnimation.route:(context) =>
        const InterleaveAnimation(),
        AnimatedSwitcherSample.route:(context) =>
        const AnimatedSwitcherSample(),
        AnimatedSwitcherCounterRoute.route:(context) =>
        const AnimatedSwitcherCounterRoute(),
        SlideTransitionSample.route:(context) =>
        const SlideTransitionSample(),
        SlideTransitionXSample.route:(context) =>
        const SlideTransitionXSample(),
        AnimationTransitionComponents.route:(context) =>
        const AnimationTransitionComponents(),
        DecorationBoxSample.route:(context) =>
        const DecorationBoxSample(),
        AnimatedWidgetsTest.route:(context) =>
        const AnimatedWidgetsTest(),

        //自定义组件
        CustomComponentsRoute.route:(context) =>
        const CustomComponentsRoute(),
        CustomComponentsIntroduce.route:(context) =>
        const CustomComponentsIntroduce(),
        CustomComponentsCombination.route:(context) =>
        const CustomComponentsCombination(),
        CustomComponentGradientButtonSample.route:(context) =>
        const CustomComponentGradientButtonSample(),
        TurnBoxSample.route:(context) =>
        const TurnBoxSample(),
        TurnBoxRoute.route:(context) =>
        const TurnBoxRoute(),
        CustomePaintAndCanvasRoute.route:(context) =>
        const CustomePaintAndCanvasRoute(),
        CustomPaintRoute.route:(context) =>
        const CustomPaintRoute(),
        CustomComponentsCircleGradientProgress.route:(context) =>
        const CustomComponentsCircleGradientProgress(),
        GradientCircularProgressRoute.route:(context) =>
        const GradientCircularProgressRoute(),
        CustomComponentCheckBox.route:(context) =>
        const CustomComponentCheckBox(),
        CustomChexboxSample.route:(context) =>
        const CustomChexboxSample(),
        CustomComponentsDoneWidget.route:(context) =>
        const CustomComponentsDoneWidget(),
        DoneWidgetSample.route:(context) =>
        const DoneWidgetSample(),

        ///文件操作与网络请求
        FileOperationAndNetwork.route:(context) =>
        const FileOperationAndNetwork(),
        FileOperationRoute.route:(context) =>
        const FileOperationRoute(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key /*, required this.title*/
      })
      : super(key: key);

  final String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    bus.on("event", (arg) {
      print("recieve event");
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextButton(
              onPressed: onPressed(context, 0), child: textcontainer("基础组件")),
          TextButton(
              onPressed: onPressed(context, 1), child: textcontainer("布局类组件")),
          TextButton(
              onPressed: onPressed(context, 2), child: textcontainer("容器类组件")),
          TextButton(
              onPressed: onPressed(context, 8), child: textcontainer("可滚动组件")),
          TextButton(
              onPressed: onPressed(context, 3), child: textcontainer("功能型组件")),
          TextButton(
              onPressed: onPressed(context, 4),
              child: textcontainer("事件处理与通知")),
          TextButton(
              onPressed: onPressed(context, 5), child: textcontainer("动画")),
          TextButton(
              onPressed: onPressed(context, 6), child: textcontainer("自定义组件")),
          TextButton(
              onPressed: onPressed(context, 7),
              child: textcontainer("文件操作与网络请求")),
        ],
      ),
    )));
  }

  onPressed(BuildContext context, num index) {
    String? routerKey;
    switch (index) {
      //基础组件
      case 0:
        routerKey = route_key_base_widget;
        break;
      //布局类组件
      case 1:
        routerKey = LayoutRoutePager.route;
        break;
      //容器类组件
      case 2:
        routerKey = ContainerRoutePager.route;
        break;
      //功能型组件
      case 3:
        routerKey = FunctionalRoutePager.route;
        break;
      //事件处理与通知
      case 4:
        routerKey = EventAndNotificationRoutePager.route;
        break;
      //动画
      case 5:
        routerKey = AnimationWidget.route;
        break;
      //自定义组件
      case 6:
        routerKey = CustomComponentsRoute.route;
        break;
      //文件操作与网络请求
      case 7:
        routerKey = FileOperationAndNetwork.route;
        break;
      case 8:
        routerKey = ScrollableWidgetRoutePager.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, routerKey!, arguments: routerKey);
    };
  }
}
