
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileOperationRoute extends StatefulWidget {
  const FileOperationRoute({Key? key}) : super(key: key);

  static const String route = "FileOperationRoute";

  @override
  State<StatefulWidget> createState() => _FileOperationRouteState();
}
class _FileOperationRouteState extends State<FileOperationRoute> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _readCounter().then((value) {
      setState(() {
        _count = value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文件操作"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text("Dart的 IO 库包含了文件读写的相关类，它属于 Dart 语法标准的一部分，所以通过 Dart IO 库，无论是 Dart VM 下的脚本还是 Flutter，都是通过 Dart IO 库来操作文件的，不过和 Dart VM 相比，Flutter 有一个重要差异是文件系统路径不同，这是因为Dart VM 是运行在 PC 或服务器操作系统下，而 Flutter 是运行在移动操作系统中，他们的文件系统会有一些差异。"),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("APP目录", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("Android 和 iOS 的应用存储目录不同，PathProvider (opens new window)插件提供了一种平台透明的方式来访问设备文件系统上的常用位置。该类当前支持访问两个文件系统位置"),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(10),
                  child: const Text("""1.临时目录: 可以使用 getTemporaryDirectory() 来获取临时目录； 系统可随时清除的临时目录（缓存）。在 iOS 上，这对应于NSTemporaryDirectory() (opens new window)返回的值。在 Android上，这是getCacheDir() (opens new window)返回的值。
2.文档目录: 可以使用getApplicationDocumentsDirectory()来获取应用程序的文档目录，该目录用于存储只有自己可以访问的文件。只有当应用程序被卸载时，系统才会清除该目录。在 iOS 上，这对应于NSDocumentDirectory。在 Android 上，这是AppData目录。
3.外部存储目录：可以使用getExternalStorageDirectory()来获取外部存储目录，如 SD 卡；由于 iOS不支持外部目录，所以在 iOS 下调用该方法会抛出UnsupportedError异常，而在 Android 下结果是Android SDK 中getExternalStorageDirectory的返回值。"""),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("一旦你的 Flutter 应用程序有一个文件位置的引用，你可以使用 dart:io (opens new window)API来执行对文件系统的读/写操作。有关使用 Dart 处理文件和目录的详细内容可以参考 Dart 语言文档，下面我们看一个简单的例子。"),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("示例", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text('$_count', textScaleFactor: 2.0,),
                )
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: _incrementCounter,
        child: const Icon(Icons.add),
        tooltip: "Increment",
      ),
    );
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  _incrementCounter() async {
    setState(() {
      _count++;
    });

    await (await _getLocalFile()).writeAsString('$_count');
  }
}
