import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContainerScaffoldPager extends StatefulWidget {
  const ContainerScaffoldPager({Key? key}) : super(key: key);
  static const String route = "container_scaffold";

  @override
  State<StatefulWidget> createState() {
    return _ContainerScaffoldState();
  }
}

class _ContainerScaffoldState extends State<ContainerScaffoldPager> {
  int _seledtIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scaffold"),
        leading: Builder(
          builder: (context) {
            return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.dashboard,
                  color: Colors.white,
                ));
          },
        ),
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), label: 'Business'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'School'),
        ],
        currentIndex: _seledtIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert_sharp),
        onPressed: _onFloatButtonTapped,
      ),
      body: Column(
        children: [],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _seledtIndex = index;
    });
  }

  void _onFloatButtonTapped() {}
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
          context: context,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      width: 100,
                      height: 100,
                      color: Colors.red,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Text("My Drawer"),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text("菜单1"),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "菜单1");
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text("菜单2"),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "菜单2");
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text("菜单3"),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "菜单3");
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  child: const Text("菜单4"),
                  onPressed: () {
                    Fluttertoast.showToast(msg: "菜单4");
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          )),
    );
  }
}
