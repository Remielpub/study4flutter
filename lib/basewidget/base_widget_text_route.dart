import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseWidgetTextRoute extends StatefulWidget {
  const BaseWidgetTextRoute({Key? key}) : super(key: key);

  @override
  State<BaseWidgetTextRoute> createState() {
    // TODO: implement createState
    return _BaseWidgetTextState();
  }
}

class _BaseWidgetTextState extends State<BaseWidgetTextRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text_Style"),
      ),
      body: Column(
        children: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "文字起点对齐 文字起点对齐 文字起点对齐 文字起点对齐 文字起点对齐 文字起点对齐 ",
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "文字居中对齐 文字居中对齐 文字居中对齐 文字居中对齐 文字居中对齐 文字居中对齐 ",
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "文字尾部对齐 文字尾部对齐 文字尾部对齐 文字尾部对齐 文字尾部对齐 文字尾部对齐 ",
              textAlign: TextAlign.end,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "文字缩放属性 ",
              textScaleFactor: 1.5,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数",
              textScaleFactor: 1.5,
              maxLines: 1,
              overflow: TextOverflow.ellipsis, //超出限制 尾部...省略
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数",
              textScaleFactor: 1.5,
              maxLines: 1,
              overflow: TextOverflow.fade, //超出限制尾部淡出，效果不明显
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数",
              maxLines: 1,
              overflow: TextOverflow.clip, //超出限制尾部截断
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
                "文字方向，left to right | right to left(设置没效果)",
                textDirection:TextDirection.ltr
            ),
          ),

          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "softWrap = false, 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数 最大行数",
              maxLines: 1,
              softWrap: false, // 默认为true， 如果为false，文本中的字形将被定位为有无限的水平空间。
            ),
          ),
        ],
      ),
    );
  }
}
