import 'package:flutter/material.dart';
import 'package:flutter_demo/basewidget/base_widget_icon_button.dart';
import 'base_widget_checkbox.dart';
import 'base_widget_circularprogressindicator_pager.dart';
import 'base_widget_icon_pager.dart';
import 'base_widget_outline_button.dart';
import 'package:flutter_demo/utils/widget_util.dart';
import 'base_widget_switch.dart';
import 'base_widget_text_button.dart';
import '../const_value.dart';
import 'button_style_pager.dart';
import 'widget_customprogressindicator_pager.dart';
import 'widget_form_pager.dart';
import 'widget_image.dart';
import 'widget_linearprogressindicator_pager.dart';
import 'widget_textfield_route.dart';

/// fullter 基础组件 pager
class BaseWidgetRoute extends StatefulWidget {
  const BaseWidgetRoute({Key? key}) : super(key: key);

  @override
  State<BaseWidgetRoute> createState() => _BaseWidgetRouteState();
}

class _BaseWidgetRouteState extends State<BaseWidgetRoute> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
        appBar: AppBar(title: const Text("基础组件")),
        body: Scrollbar(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textcontainer("Text"),
              TextButton(
                onPressed: onTextPressed(context, 0),
                child: textcontainer2("Text 显示样式"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 1),
                child: textcontainer2("Text Style 属性"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 2),
                child: textcontainer2("Text Span 属性"),
              ),
              TextButton(
                onPressed: onTextPressed(context, 3),
                child: textcontainer2("DefaultTextStyle 属性"),
              ),
              textcontainer("Button"),
              TextButton(onPressed: onTextPressed(context, 4), child: textcontainer2("ElevatedButton")),
              TextButton(onPressed: onTextPressed(context, 5), child: textcontainer2("TextButton")),
              TextButton(onPressed: onTextPressed(context, 6), child: textcontainer2("OutlineButton")),
              TextButton(onPressed: onTextPressed(context, 7), child: textcontainer2("IconButton")),
              TextButton(onPressed: onTextPressed(context, 8), child: textcontainer2("ButtonStyle")),
              textcontainer("图片及ICON"),
              TextButton(onPressed: onTextPressed(context, 9), child: textcontainer2("Image")),
              TextButton(onPressed: onTextPressed(context, 10), child: textcontainer2("ICON")),
              textcontainer("单选开关和复选框"),
              TextButton(onPressed: onTextPressed(context, 11), child: textcontainer2("Switch")),
              TextButton(onPressed: onTextPressed(context, 12), child: textcontainer2("Checkbox")),
              textcontainer("输入框及表单"),
              TextButton(onPressed: onTextPressed(context, 13), child: textcontainer2("输入框---TextField")),
              TextButton(onPressed: onTextPressed(context, 14), child: textcontainer2("表单---Form")),
              textcontainer("进度指示器"),
              TextButton(onPressed: onTextPressed(context, 15), child: textcontainer2("线性、条状的进度条 --- LinearProgressIndicator")),
              TextButton(onPressed: onTextPressed(context, 16), child: textcontainer2("圆形进度条 --- CircularProgressIndicator")),
              TextButton(onPressed: onTextPressed(context, 17), child: textcontainer2("自定义样式进度条")),
            ],
          ),
        )));
  }
}

onTextPressed(BuildContext context, int index) {
  String? routeKey;
  switch (index) {
    case 0:
      routeKey = route_key_text_content;
      break;
    case 1:
      routeKey = route_key_text_style;
      break;
    case 2:
      routeKey = route_key_text_span;
      break;
    case 3:
      routeKey = route_key_default_text_style;
      break;
    case 4:
      routeKey = route_key_elevated_button;
      break;
    case 5:
      routeKey = BaseWidgetTextButtonPager.route;
      break;
    case 6:
      routeKey = BaseWidgetOutlineButtonPager.route;
      break;
    case 7:
      routeKey = IconButtonPager.route;
      break;
    case 8:
      routeKey = ButtonStylePager.route;
      break;
    case 9:
      routeKey = WidgetImagePager.route;
      break;
    case 10:
      routeKey = WidgetIconPager.route;
      break;
    case 11:
      routeKey = WidgetSwitchPager.route;
      break;
    case 12:
      routeKey = WidgetCheckBoxPager.route;
      break;
    case 13:
      routeKey = WidgetTextFieldPager.route;
      break;
    case 14:
      routeKey = WidgetFormPager.route;
      break;
    case 15:
      routeKey = WidgetLinearProgressIndicatorPager.route;
      break;
    case 16:
      routeKey = WidgetCircularProgressIndicatorPager.route;
      break;
    case 17:
      routeKey = WidgetCustomProgressIndicatorPager.route;
      break;
  }
  return () {
    Navigator.pushNamed(context, routeKey!);
  };
}
