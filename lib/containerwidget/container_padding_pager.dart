import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerPaddingPager extends StatefulWidget {
  const ContainerPaddingPager({Key? key}) : super(key: key);
  static const String route = "container_padding";

  @override
  State<StatefulWidget> createState() {
    return _ContainerPaddingState();
  }
}

class _ContainerPaddingState extends State<ContainerPaddingPager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Padding"),
      ),
      body: Column(
        children: [
          const Text(" EdgeInsets.all()"),
          Container(
            margin: const EdgeInsets.all(10),
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "text 1",
                  style: TextStyle(backgroundColor: Colors.red),
                ),
              ),
            ),
          ),
          const Text("  EdgeInsets.only(top: 10)"),
          Container(
            margin: const EdgeInsets.all(10),
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "text 1",
                  style: TextStyle(backgroundColor: Colors.red),
                ),
              ),
            ),
          ),
          const Text("  EdgeInsets.fromLTRB(20, 10, 20, 10)"),
          Container(
            margin: const EdgeInsets.all(10),
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Text(
                  "text 1",
                  style: TextStyle(backgroundColor: Colors.red),
                ),
              ),
            ),
          ),
          const Text(" EdgeInsets.symmetric(vertical: 10"),

          Container(
            margin: const EdgeInsets.all(10),
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "text 1",
                  style: TextStyle(backgroundColor: Colors.red),
                ),
              ),
            ),
          ),
          const Text(" EdgeInsets.symmetric(horizontal: 10"),
          Container(
            margin: const EdgeInsets.all(10),
            child: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "text 1",
                  style: TextStyle(backgroundColor: Colors.red),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
