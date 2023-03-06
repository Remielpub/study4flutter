import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WillPopScopeSample extends StatefulWidget {
  const WillPopScopeSample({Key? key}) : super(key: key);
  static const String route = "willpopscopesample";

  @override
  State<StatefulWidget> createState() {
    return WillPopScopeSampleState();
  }
}

class WillPopScopeSampleState extends State<WillPopScopeSample> {
  DateTime? _lastPressAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WillPopScope"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: const Text("WillPopScope的默认构造函数"),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("""const WillPopScope({
  ...
  required WillPopCallback onWillPop,
  required Widget child
})"""),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text(
                            "onWillPop是一个回调函数，当用户点击返回按钮时被调用（包括导航返回按钮及Android物理返回按钮）。该回调需要返回一个Future对象，如果返回的Future最终值为false时，则当前路由不出栈(不会返回)；最终值为true时，当前路由出栈退出。我们需要提供这个回调来决定是否退出"),
                      ),
                      WillPopScope(
                        onWillPop: () async {
                          if (_lastPressAt == null ||
                              DateTime.now().difference(_lastPressAt!) >
                                  const Duration(seconds: 1)) {
                            _lastPressAt = DateTime.now();
                            return false;
                          }
                          return true;
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 100),
                          alignment: Alignment.center,
                          child: const Text("1秒内连续按两次返回键退出", textScaleFactor: 1.0, style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
