
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/widget_util.dart';

class FunctionalWidgetColorAndTheme extends StatelessWidget {
  const FunctionalWidgetColorAndTheme({Key? key}) : super(key: key);
  static const String route= "functionalwidgetcolorandtheme";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("颜色和主题"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: const Text("颜色", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 10),
                      child: const Text("在介绍主题前我们先了解一些Flutter中的 Color 类。Color 类中颜色以一个 int 值保存，我们知道显示器颜色是由红、绿、蓝三基色组成，每种颜色占8比特，存储结构如下"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Image.asset("assets/20230222142659.jpg"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上面表格中的的字段在 Color 类中都有对应的属性，而Color中的众多方法也就是操作这些属性的，由于大多比较简单，读者可以查看类定义了解。在此我们主要讨论两点：色值转换和亮度。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("1.如何将颜色字符串转成 Color 对象", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""Color(0xffdc380d); //如果颜色固定可以直接使用整数值
//颜色是一个字符串变量
var c = "dc380d";
Color(int.parse(c,radix:16)|0xFF000000) //通过位运算符将Alpha设置为FF
Color(int.parse(c,radix:16)).withAlpha(255)  //通过方法将Alpha设置为FF"""),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("2.颜色亮度", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("假如，我们要实现一个背景颜色和Title可以自定义的导航栏，并且背景色为深色时我们应该让Title显示为浅色；背景色为浅色时，Title 显示为深色。要实现这个功能，我们就需要来计算背景色的亮度，然后动态来确定Title的颜色。Color 类中提供了一个computeLuminance()方法，它可以返回一个[0-1]的一个值，数字越大颜色就越浅，我们可以根据它来动态确定Title的颜色，下面是导航栏NavBar的简单实现"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""class NavBar extends StatelessWidget {
  final String title;
  final Color color; //背景颜色

  NavBar({
    Key? key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black,
        ),
      ),
      alignment: Alignment.center,
    );
  }
}"""),
                    ),
                    titleWidget(context, "示例1", 0, _onPress),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("3.MaterialColor", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("MaterialColor是实现Material Design中的颜色的类，它包含一种颜色的10个级别的渐变色。MaterialColor通过 [] 运算符的索引值来代表颜色的深度，有效的索引有：50，100，200，…，900，数字越大，颜色越深。MaterialColor的默认值为索引等于500的颜色"),
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
                      child: const Text("主题（Theme）", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("Theme组件可以为Material APP定义主题数据（ThemeData）。Material组件库里很多组件都使用了主题数据，如导航栏颜色、标题字体、Icon样式等。Theme内会使用InheritedWidget来为其子树共享样式数据。"),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("1.ThemeData", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("ThemeData用于保存是Material 组件库的主题数据，Material组件需要遵守相应的设计规范，而这些规范可自定义部分都定义在ThemeData中了，所以我们可以通过ThemeData来自定义应用主题。在子组件中，我们可以通过Theme.of方法来获取当前的ThemeData。"),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("我们看看ThemeData部分数据定义："),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("""ThemeData({
  Brightness? brightness, //深色还是浅色
  MaterialColor? primarySwatch, //主题颜色样本，见下面介绍
  Color? primaryColor, //主色，决定导航栏颜色
  Color? cardColor, //卡片颜色
  Color? dividerColor, //分割线颜色
  ButtonThemeData buttonTheme, //按钮主题
  Color dialogBackgroundColor,//对话框背景颜色
  String fontFamily, //文字字体
  TextTheme textTheme,// 字体主题，包括标题、body等文字样式
  IconThemeData iconTheme, // Icon的默认样式
  TargetPlatform platform, //指定平台，应用特定平台控件风格
  ColorScheme? colorScheme,
  ...
})"""),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: const Text("上面只是ThemeData的一小部分属性，完整的数据定义读者可以查看SDK。上面属性中需要说明的是primarySwatch，它是主题颜色的一个 样本色，通过这个样本色可以在一些条件下生成一些其他的属性，例如，如果没有指定primaryColor，并且当前主题不是深色主题，那么primaryColor就会默认为primarySwatch指定的颜色，还有一些相似的属性如indicatorColor也会受primarySwatch影响。"),
                    ),
                    titleWidget(context, "主题示例", 1, _onPress)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  _onPress(BuildContext context, int i) {
    String? route;
    switch(i) {
      case 0:
        route = ColorSample.route;
        break;
      case 1:
        route = ThemeSample.route;
        break;
    }
    return () {
      Navigator.pushNamed(context, route!);
    };
  }
}

class ThemeSample extends StatefulWidget {
  const ThemeSample({Key? key}) : super(key: key);

  static const String route = "themesample";

  @override
  State<StatefulWidget> createState() {
    return _ThemeSampleState();
  }
}

class _ThemeSampleState extends State<ThemeSample> {
  var _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return Theme(data: ThemeData(
      primarySwatch: _themeColor,
      iconTheme: IconThemeData(color: _themeColor)
    ), child: Scaffold(
      appBar: AppBar(
        title: const Text("主题测试"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //第一行Icon使用主题中的iconTheme
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.favorite),
                Icon(Icons.airport_shuttle),
                Text("  颜色跟随主题")
              ]
          ),

          Theme(data: themeData.copyWith(
            iconTheme: themeData.iconTheme.copyWith(
              color: Colors.black
            )
          ), child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("  颜色固定黑色")
            ],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _themeColor =
          _themeColor == Colors.teal ? Colors.blue : Colors.teal;
        });
      },
        child: const Icon(Icons.palette),
      ),
    ));
  }
}

class NavBar extends StatelessWidget {
  final String title;
  final Color color;

  const NavBar({Key? key, required this.title, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 52,
        minWidth: double.infinity
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3
          )
        ]
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color.computeLuminance() < 0.5 ? Colors.white: Colors.black
        ),
      ),
      alignment: Alignment.center,
    );
  }

}
class ColorSample extends StatelessWidget {
  const ColorSample({Key? key}) : super(key: key);
  static const String route = "color_sample";

  @override
  Widget build(BuildContext context) {
    var c = "dc380d";

    return Scaffold(
      appBar: AppBar(
        title: const Text("颜色示例"),
      ),
      body: Column(
        children: const [
          NavBar(title: "标题1", color: Colors.blue),
          NavBar(title: "标题2", color: Colors.yellow),
          NavBar(title: "标题3", color: Colors.red),
          NavBar(title: "标题4", color: Colors.black26),
        ],
      ),
    );
  }
}
