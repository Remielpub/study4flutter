
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerBottomTagPager extends StatefulWidget {
  const ContainerBottomTagPager({Key? key}) : super(key: key);
  static const String route = "container_bottomtag";

  @override
  State<StatefulWidget> createState() {
      return _ContainerBottomTagState();
  }

}

class _ContainerBottomTagState extends State<ContainerBottomTagPager>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bottom Tag Navigator"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: const Icon(Icons.add)),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(icon: const Icon(Icons.home), onPressed: () {  },),
            const SizedBox(),
            IconButton(icon: Icon(Icons.business), onPressed: () {  },),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
        ),

      ),
      body: Column(
        children: [

        ],
      ),
    );
  }

}
