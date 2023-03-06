import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class CustomComponentsCombination extends StatelessWidget {
  const CustomComponentsCombination({Key? key}) : super(key: key);

  static const String route = "CustomComponentsCombination";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("组合现有组件"),
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
                          "在Flutter中页面UI通常都是由一些低级别组件组合而成，当我们需要封装一些通用组件时，应该首先考虑是否可以通过组合其他组件来实现，如果可以，则应优先使用组合，因为直接通过现有组件拼装会非常简单、灵活、高效。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "实例：自定义渐变按钮",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text(
                        "1. 实现GradientButton",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                          "Flutter Material组件库中的按钮默认不支持渐变背景，为了实现渐变背景按钮，我们自定义一个GradientButton组件，它需要支持一下功能："),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text("""1.背景支持渐变色
2.手指按下时有涟漪效果
3.可以支持圆角"""),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                          "我们DecoratedBox可以支持背景色渐变和圆角，InkWell在手指按下有涟漪效果，所以我们可以通过组合DecoratedBox和InkWell来实现GradientButton."),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                                CustomComponentGradientButtonSample.route);
                          },
                          child: textcontainer("示例")),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("总结", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("通过组合的方式定义组件和我们之前写界面并无差异，不过在抽离出单独的组件时我们要考虑代码规范性，如必要参数要用required关键词标注，对于可选参数在特定场景需要判空或设置默认值等。这是由于使用者大多时候可能不了解组件的内部细节，所以为了保证代码健壮性，我们需要在用户错误地使用组件时能够兼容或报错提示（使用assert断言函数）。"),
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

class GradientButton extends StatelessWidget {
  const GradientButton(
      {Key? key,
      this.colors,
      this.width,
      this.height,
      this.borderRadius,
      required this.child,
      this.onTap})
      : super(key: key);

  // 渐变色数组
  final List<Color>? colors;

  //按钮宽高
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;

  final GestureTapCallback? onTap;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: _colors),
          borderRadius: borderRadius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: DefaultTextStyle(
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomComponentGradientButtonSample extends StatelessWidget {
  const CustomComponentGradientButtonSample({Key? key}) : super(key: key);

  static const String route = "CustomComponentGradientButtonSample";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CustomComponentGradientButtonSample"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const GradientButton(
              child: Text("哈哈哈哈哈"),
              colors: [Colors.black, Colors.white],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: onTap,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            child: const GradientButton(
              child: Text("哈哈哈哈哈"),
              colors: [Colors.yellow, Colors.red, Colors.blue],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: onTap,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(top: 10),
            child: const GradientButton(
                child: Text("哈哈哈哈哈"),
                colors: [Colors.yellow, Colors.red, Colors.green, Colors.blue],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                onTap: onTap),
          )
        ],
      ),
    );
  }
}

onTap() {
  print("button click");
}
