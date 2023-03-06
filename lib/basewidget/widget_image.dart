import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetImagePager extends StatefulWidget {
  const WidgetImagePager({Key? key}) : super(key: key);

  static const String route = "widget_image";

  @override
  State<StatefulWidget> createState() {
    return _ButtonStylePagerState();
  }
}

class _ButtonStylePagerState extends State<WidgetImagePager> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
          appBar: AppBar(
            title: const Text("WidgetImage"),
          ),
          body:  Scrollbar(
            child: SingleChildScrollView(
              child: DefaultTextStyle(
            style: const TextStyle(
                color: Colors.deepOrange,
                fontSize: 18,
                fontWeight: FontWeight.bold),
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text("加载本地图片，方式1---Image.asset"),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: Image.asset(
                        "assets/avatar.jpg",
                        width: 200,
                      )),
                  const Text("加载本地图片，方式2---Image(image:AssetImage(...))"),
                  Container(
                      margin: const EdgeInsets.all(10),
                      child: const Image(
                        image: AssetImage("assets/avatar.jpg"),
                        width: 100,
                      )),
                  const Text("加载网络图片，方式1---Image(NetworkImage(...))"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Image(
                      image: NetworkImage(
                          "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                      width: 200,
                    ),
                  ),
                  const Text("加载网络图片，方式1---Image.network(...))"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 100,
                    ),
                  ),
                  const Text("图片缩放属性 fit --- BoxFit.fill: 会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形)"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.fill,
                      width: 100,
                      height: 50,
                    ),
                  ),
                  const Text("图片缩放属性 fit --- BoxFit.contain: 这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形)"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.contain,
                      width: 100,
                      height: 50,
                    ),
                  ),
                  const Text("图片缩放属性 fit --- BoxFit.cover: 会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.cover,
                      width: 100,
                      height: 50,
                    ),
                  ),
                  const Text("图片缩放属性 fit --- BoxFit.fitWidth: 图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.fitWidth,
                      width: 100,
                      height: 50,
                    ),
                  ),
                  const Text("图片缩放属性 fit --- BoxFit.fitHeight:图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.fitHeight,
                      width: 100,
                      height: 50,
                    ),
                  ),
                  const Text("图片缩放属性 fit --- BoxFit.none:图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      fit: BoxFit.none,
                      width: 100,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
