import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonStylePager extends StatefulWidget {
  const ButtonStylePager({Key? key}) : super(key: key);

  static const String route = "button_style";

  @override
  State<StatefulWidget> createState() {
    return _ButtonStylePagerState();
  }
}

class _ButtonStylePagerState extends State<ButtonStylePager> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("ButtonStylePager"),
      ),
      body: DefaultTextStyle(
        style: const TextStyle(
            color: Colors.deepOrange,
            fontSize: 18,
            fontWeight: FontWeight.bold),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Button style --- 圆角 "),
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Colors.red, width: 2)),
                    ),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Button style --- 边框 "),
                    )),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            const BorderSide(color: Colors.red, width: 2)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber)),
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Button style --- shape 等细节待完善 "),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
