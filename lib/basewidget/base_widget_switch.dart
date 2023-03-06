import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetSwitchPager extends StatefulWidget {
  const WidgetSwitchPager({Key? key}) : super(key: key);

  static const String route = "switch";

  @override
  State<StatefulWidget> createState() {
    return _WidgetSwitchState();
  }
}

class _WidgetSwitchState extends State<WidgetSwitchPager> {
  bool _switchSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch"),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                child: Switch(
                  value: _switchSelected,
                  activeColor: Colors.pink,
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.black,
                  inactiveTrackColor: Colors.black45,
                  onChanged: (bool value) {
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
              ),
              Text(_switchSelected ? "开" : "关"),
            ],
          )),
    );
  }
}
