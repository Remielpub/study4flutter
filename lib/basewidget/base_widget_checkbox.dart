import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetCheckBoxPager extends StatefulWidget {
  const WidgetCheckBoxPager({Key? key}) : super(key: key);

  static const String route = "checkbox";

  @override
  State<StatefulWidget> createState() {
    return _WidgetCheckBoxState();
  }
}

class _WidgetCheckBoxState extends State<WidgetCheckBoxPager> {
  bool _selectedValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckBox"),
      ),
      body: Container(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Checkbox(
                onChanged: (bool? value) {
                  setState(() {
                    _selectedValue = value!;
                  });
                },
                value: _selectedValue,
              ),
            ),
            Text(_selectedValue ? "已勾选" : "未勾选"),
          ],
        ),
      ),
    );
  }
}
