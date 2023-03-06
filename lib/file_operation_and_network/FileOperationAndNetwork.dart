
import 'package:flutter/material.dart';
import '../utils/widget_util.dart';
import 'file_operation.dart';

class FileOperationAndNetwork extends StatelessWidget {
  const FileOperationAndNetwork({Key? key}) : super(key: key);

  static const String route = "FileOperationAndNetwork";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("文件操作与网络请求"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                  onPressed: onPressed(context, 0), child: textcontainer("文件操作")),
              TextButton(
                  onPressed: onPressed(context, 1), child: textcontainer("Http请求-HttpClient")),
              TextButton(
                  onPressed: onPressed(context, 2), child: textcontainer("Http请求-Dio package")),
              TextButton(
                  onPressed: onPressed(context, 3), child: textcontainer("实例：Http分块下载")),
              TextButton(
                  onPressed: onPressed(context, 4), child: textcontainer("WebSocket")),
              TextButton(
                  onPressed: onPressed(context, 5), child: textcontainer("使用Socket API")),
              TextButton(
                  onPressed: onPressed(context, 6), child: textcontainer("Json转Dart Model类")),
            ],
          ),
        ),
      ),
    );
  }
  onPressed(BuildContext context, int i) {
    String? route;
    switch(i) {
      case 0:
        route = FileOperationRoute.route;
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
    }

    return () {
      Navigator.of(context).pushNamed(route!);
    };
  }
}
