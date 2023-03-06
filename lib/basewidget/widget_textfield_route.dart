import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetTextFieldPager extends StatefulWidget {
  const WidgetTextFieldPager({Key? key}) : super(key: key);
  static const String route = "textfield";

  @override
  State<StatefulWidget> createState() {
    return _WidgetTextFieldState();
  }
}

class _WidgetTextFieldState extends State<WidgetTextFieldPager> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TextField"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Container(
            margin: const EdgeInsets.all(10),
            child:  TextField(
              autofocus: true,
              controller: _controller1,
              decoration: const InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
              onChanged: (v) {
                log("用户名输入： --- $v");
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: TextField(
              autofocus: true,
              controller: _controller2,
              decoration: const InputDecoration(
                  labelText: "密码",
                  hintText: "您的登陆密码",
                  prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
              onChanged: (v){
                log("密码输入： --- $v");
              },
            ),
          ),
        ],
        ),
      ),
    );
  }
}
