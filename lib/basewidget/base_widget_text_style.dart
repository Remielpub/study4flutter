import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetTextStyleRoute extends StatelessWidget {
  const BaseWidgetTextStyleRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   final Paint p = Paint();
    p.strokeWidth = 3;
    p.style = PaintingStyle.stroke;

    return Scaffold(
      appBar: AppBar(
        title: const Text("TextStyle属性 "),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "color---文字颜色 ",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "backgroundColor---文字背景颜色 ",
                  style: TextStyle(
                      color: Colors.blue, backgroundColor: Colors.amberAccent),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "fontSize---文字大小 ",
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.amberAccent,
                      fontSize: 18),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "fontWeight---FontWeight, 文字粗体 ",
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.amberAccent,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "fontStyle---FontStyle,文字正常/斜体 ",
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.amberAccent,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "wordSpacing---针对单词间有空格添加额外距离，如：你好 哈哈",
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.amberAccent,
                      wordSpacing: 10),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "letterSpacing---在字间添加额外距离",
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.amberAccent,
                      letterSpacing: 10),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "textBaseline---TextBaseline: alphabetic/ideographic(两种取值没看出区别)",
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.amberAccent,
                      textBaseline: TextBaseline.alphabetic),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "height---文本上下行间距倍数，具体属性见文档-------",
                  style: TextStyle(
                      color: Colors.blue,
                      backgroundColor: Colors.amberAccent,
                      height: 2),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "foreground---????",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "decoration---TextDecoration，\n"
                  "文字装饰：\n"
                  " TextDecoration.overline---上划线\n"
                  " TextDecoration.lineThrough --- 文字中间划线\n"
                  " extDecoration.underline --- 下划线",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.overline,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: const [
                    Text(
                      "decorationColor---下划线颜色,\n"
                      "decorationThickness --- 划线粗度",
                      style: TextStyle(
                          color: Colors.blue,
                          backgroundColor: Colors.amberAccent,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationThickness: 2.85),
                    ),
                    Text(
                      "decorationStyle---下划线风格："
                      "TextDecorationStyle.solid ---- 实线",
                      style: TextStyle(
                          color: Colors.blue,
                          backgroundColor: Colors.amberAccent,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.solid,
                          decorationThickness: 2.85),
                    ),
                    Text(
                      "decorationStyle---下划线风格："
                      "TextDecorationStyle.double ---- 双实线",
                      style: TextStyle(
                          color: Colors.blue,
                          backgroundColor: Colors.amberAccent,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.double,
                          decorationThickness: 2.85),
                    ),
                    Text(
                      "decorationStyle---下划线风格："
                      "TextDecorationStyle.dotted ---- 虚线",
                      style: TextStyle(
                          color: Colors.blue,
                          backgroundColor: Colors.amberAccent,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.dotted,
                          decorationThickness: 2.85),
                    ),
                    Text(
                      "decorationStyle---下划线风格："
                      "TextDecorationStyle.dashed ---- 虚线",
                      style: TextStyle(
                          color: Colors.blue,
                          backgroundColor: Colors.amberAccent,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.dashed,
                          decorationThickness: 2.85),
                    ),
                    Text(
                      "decorationStyle---下划线风格："
                      "TextDecorationStyle.wavy ---- 波浪线",
                      style: TextStyle(
                          color: Colors.blue,
                          backgroundColor: Colors.amberAccent,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.wavy,
                          decorationThickness: 2.85),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
