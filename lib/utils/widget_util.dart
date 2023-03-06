import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textcontainer(String title) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.all(10),
    color: Colors.blue,
    child: Text(
      title,
      style: const TextStyle(
          color: Colors.black87,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: "Courier"),
      textAlign: TextAlign.center,
    ),
  );
}

Widget textcontainer2(String title) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.all(10),
    margin: const EdgeInsets.fromLTRB(60, 5, 60, 5),
    color: Colors.red,
    child: Text(
      title,
      style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 15,
          fontFamily: "Courier"),
      textAlign: TextAlign.center,
    ),
  );
}

Widget titleWidget(
    BuildContext context, String title, int index, Function onPress) {
  return Container(
    alignment: Alignment.center,
    child: TextButton(
        onPressed: onPress(context, index), child: textcontainer(title)),
  );
}

double hc_ScreenWidth() {
  return window.physicalSize.width/window.devicePixelRatio;
}

double hc_ScreenHeight(){
  return window.physicalSize.height/window.devicePixelRatio;
}

double hc_FitWidth(double width) {
  return hc_ScreenWidth()/375.0 *width;
}

double hc_FitHeight(double height) {
  return hc_ScreenHeight()/667.0 *height;
}
