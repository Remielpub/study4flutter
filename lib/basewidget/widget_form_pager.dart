import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetFormPager extends StatefulWidget {
  const WidgetFormPager({Key? key}) : super(key: key);
  static const String route = "widget_form";

  @override
  State<StatefulWidget> createState() {
    return _WidgetFormPagerState();
  }
}

class _WidgetFormPagerState extends State<WidgetFormPager> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form"),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction, child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            controller: _controller1,
            decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
            validator: (v) {
              return v!.trim().isEmpty ? "用户名不能为空" : null;
            },
          ),
          TextFormField(
            autofocus: true,
            controller: _controller2,
            decoration: const InputDecoration(
              labelText: "密码",
              hintText: "您的登陆密码",
              prefixIcon: Icon(Icons.lock),
            ),
            validator: (v) {
              return v!.trim().length > 5 ? null : "密码不能少于6位";
            },
          ),
          Padding(padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text("登陆"),
                      ),
                      onPressed:() {
                        if((_formKey.currentState as FormState).validate()) {
                          log(" 用户名 --- ${_controller1.text}, 密码 --- ${_controller2.text} 进行登陆");
                        }
                      },

                ))
              ],
            ),
          )
        ],
      ),
      ),
    );
  }

}
